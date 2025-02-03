--怪物个人押镖AI

_G.CMonsterAIRoleEscort = CMonsterAIStateBase:new()
local dwStateId = MonsterState.RoleEscort

------------------------------------------------
--新建
function CMonsterAIRoleEscort:new()
	local objState = {}
	for k,v in pairs(CMonsterAIRoleEscort) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-------------------------------------------------
--创建
function CMonsterAIRoleEscort:Create(objMon,sysMonsterAI)
	self.objMon = objMon						--怪物对象
	self.sysMonsterAI = sysMonsterAI			--AI系统
	self.LineInfo = nil
	self.dwBornRoleID = 0;
	self.szBornName = "";
	self.dwBornTime = 0;
	
	self.dwCurRoleID = 0;
	self.szCurRoleName = "";
	
	self.dwLastMove = 0;
	self.dwMoveDelay = 1000;
	self.dwLevel = 0
	self.dwSearchDelay = 3000
	self.dwLastSearch = 0
	self.dwLastSend = 0;
	
	self.isSuccEnd = nil;
	
	self.dwLastCheckLeader = 0;--上一次发现会长在身边的时间
end

function CMonsterAIRoleEscort:Enter(tbBornInfo,dwCurRoleID,szCurRoleName)
	local LineInfo = tbBornInfo.LineInfo;
	local dwBornRoleID = tbBornInfo.dwBornRoleID;
	local szBornName = tbBornInfo.szBornName;
	
	self.LineInfo = {}
	for i=1,#LineInfo do
		self.LineInfo[i] = LineInfo[i]
	end
	self.dwBornRoleID = dwBornRoleID
	self.szBornName = szBornName;
	self.dwLevel = tbBornInfo.dwLevel
	self.dwQuality = tbBornInfo.dwQuality;
	
	self.dwCurRoleID = dwCurRoleID or dwBornRoleID;
	self.szCurRoleName = szCurRoleName or szBornName;
	
	self.isSuccEnd = nil;
	
	local dwNow = GetCurTime();
	self.dwBornTime = tbBornInfo.dwBornTime or dwNow;
	self.dwLastCheckLeader = dwNow;
	
	--改名字
	local szMonName = self.objMon:GetName();
	if self.szBornName == self.szCurRoleName then
		szMonName = string.format(SysStringConfigInfo[13001310001],szBornName);
	else
		szMonName = string.format(SysStringConfigInfo[13001310002],szCurRoleName,szBornName);
	end
	self.objMon:SetSendData(1,szMonName);
	
	self.objMon:GetMgr():InsertEscortNode(self.objMon:GetRoleID(),self.objMon)
	
	if not dwCurRoleID then
		self:SendNotice(13001310009)
		self.objMon:Say(SysStringConfigInfo[13001310009]);
	end
end;

function CMonsterAIRoleEscort:SlowUpdate()
	--lw：镖车已经走到终点了，不再执行其他逻辑
	if self.isSuccEnd then
		return;
	end
	local dwNowTime = GetCurTime()
	--定时通知镖车位置
	if dwNowTime - self.dwLastSend > EscortConfig.dwEscortSendPosTick then
		self.dwLastSend = dwNowTime
		self:SendPos()
	end
	--判断是否超时
	if dwNowTime - self.dwBornTime - EscortConfig.dwFailTime > 1 then
		local mgrMon = self.objMon.Map:GetMonsterMgr()
		mgrMon:DelRoleMonster(self.objMon:GetRoleID())
		self:SendRes(1)
		self:SendNotice(13001310005)
		return;
	end
	--超时警告
	if self.dwBornTime + EscortConfig.dwFailTime - dwNowTime < EscortConfig.dwFailNoticeTime then
		self:SendNotice(13001310004)
	end
	
	
	if dwNowTime - self.dwLastMove < self.dwMoveDelay then return end
	if self.objMon:GetSystem("CMonsterMoveSystem"):IsMoving() then return end;
	--移动
	self.dwLastMove = dwNowTime
	local PosMon = self.objMon:GetVectorPos()
	if math.sqrt((PosMon.x-self.LineInfo[1].fin.x)^2+(PosMon.y-self.LineInfo[1].fin.y)^2)<self.LineInfo[1].round then
		-- table.remove(self.LineInfo,1)
		--到达终点
		self.isSuccEnd = true;
		
		self:SendRes(0)
		self:SendNotice(13001310007)
		self.objMon:Say(SysStringConfigInfo[13001310007]);
		-- self.objMon.isNotHurt = true;
		
		local mgrMon = self.objMon.Map:GetMonsterMgr()
		local f = function() mgrMon:DelRoleMonster(self.objMon:GetRoleID()) end
		CDelayerManager:Delay(eDelay._10sec,f)
		return
	end
	local Map = self.objMon.Map
	local objPlayer = Map:GetPlayerByRoleID(self.dwCurRoleID)
	if not objPlayer then
		self:NoticeLeaderLength(dwNowTime);
		return
	end
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local PosPlayer = sysMap:GetPlayerPos()
	if math.sqrt((PosMon.x-PosPlayer.x)^2+(PosMon.y-PosPlayer.y)^2)<EscortConfig.dwFollowDis then
		if math.sqrt((PosMon.x-PosPlayer.x)^2+(PosMon.y-PosPlayer.y)^2)>2 then
			local path = Map:GetPath(PosMon,PosPlayer)
			if path then
				self.objMon:GetSystem("CMonsterMoveSystem"):StartMove(path[2].x,path[2].y)
			end
			self.dwLastCheckLeader = dwNowTime;
		end
	else
		self:NoticeLeaderLength(dwNowTime);
	end
end;

--离开
function CMonsterAIRoleEscort:Exit()
	self.objMon:GetMgr():RemoveEscortNode(self.objMon:GetRoleID())
end

-------------------------------------------------
--方法
--向KS返回押镖结果
--dwRsl:0--成功；1--超时；2--死亡；3--离开镖车超时
function CMonsterAIRoleEscort:SendRes(dwRsl)
	--local Map = self.objMon.Map;
	--local objPlayer = Map:GetAllPlayer(self.dwCurRoleID);
	
	CEscortManager:SetEscortResult(self.dwCurRoleID,dwRsl,self.dwBornTime, self.dwLevel,self.dwQuality,self.dwBornRoleID);

end
--向Clt同步位置
function CMonsterAIRoleEscort:SendPos()
	local dwMapID,fPosX,fPosY = self.objMon:GetPos()
	local dwHp = self.objMon:GetHP()
	local dwMaxHp = self.objMon:GetMaxHP()
	
	_G.GSRemoteCall(self.dwCurRoleID, "CEscortSystem", "SynEscortPos",{dwHp,dwMaxHp,dwMapID,fPosX,fPosY,self.dwBornTime,self.dwLevel,self.dwQuality});
end
--向KS发送提示信息
function CMonsterAIRoleEscort:SendNotice(dwStringID,tabArgv)
	self.tabNoticeCoolDown = self.tabNoticeCoolDown or {}
	local dwCoolDown = EscortConfig.Notice[dwStringID];
	local dwGuildID = self.objMon:GetGuildID()
	local bFlag = true
	if dwCoolDown then
		local dwLastTime = self.tabNoticeCoolDown[dwStringID] or 0
		if dwCoolDown + dwLastTime > GetCurTime() then
			bFlag = false
		else
			self.tabNoticeCoolDown[dwStringID] = GetCurTime()
		end
	end
	if not bFlag then return end
	
	_G.GSRemoteCall(self.dwCurRoleID, "CEscortSystem", "SendEscortMsg", {dwStringID,tabArgv});
	-- CGuildServerMsg:NotifyKernel('EscortNotice',dwGuildID,dwStringID,tabArgv)
end
--发现距离过远
function CMonsterAIRoleEscort:NoticeLeaderLength(dwNowTime)
	local dwDis = dwNowTime - self.dwLastCheckLeader;
	--离开镖车超时，失败
	if dwDis > EscortConfig.dwLeaderFailTime then
		self:SendRes(3)
		self:SendNotice(13001310006);
		local mgrMon = self.objMon.Map:GetMonsterMgr()
		mgrMon:DelRoleMonster(self.objMon:GetRoleID())
		return;
	end
	if dwDis < EscortConfig.dwNoticeLeaderLength then
		return;
	end
	
	local dwMapID,_x,_y = self.objMon:GetPos();
	_x = math.floor(_x);
	_y = math.floor(_y);
	local szMapName = "";
	if MapInfoConfig[dwMapID] then
		szMapName = MapInfoConfig[dwMapID].szName;
	end
	local args = {};
	args[1] = szMapName;
	args[2] = _x;
	args[3] = _y;
	
	self:SendNotice(13001310003,args);
end;

function CMonsterAIRoleEscort:GetEscortInfo()
	local tbInfo = {};
	tbInfo.dwBornRoleID = self.dwBornRoleID;
	tbInfo.szBornName = self.szBornName;
	tbInfo.dwBornTime = self.dwBornTime;
	
	tbInfo.dwCurRoleID = self.dwCurRoleID;
	tbInfo.szCurRoleName = self.szCurRoleName;
	
	tbInfo.dwLevel = self.dwLevel;
	tbInfo.dwQuality = self.dwQuality;
	
	tbInfo.LineInfo = self.LineInfo;
	
	return tbInfo;
end;
-------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIRoleEscort)
