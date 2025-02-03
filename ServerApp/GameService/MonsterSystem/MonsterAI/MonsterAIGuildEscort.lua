--[[
	怪物系统 AI系统 追击状态
	周长沙
	2012-4-17
--]]

_G.CMonsterAIGuildEscort = CMonsterAIStateBase:new()
local dwStateId = MonsterState.GuildEscort
------------------------------------------------
--新建
function CMonsterAIGuildEscort:new()
	local objState = {}
	for k,v in pairs(CMonsterAIGuildEscort) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-------------------------------------------------
--创建
function CMonsterAIGuildEscort:Create(objMon,sysMonsterAI)
	self.objMon = objMon						--怪物对象
	self.sysMonsterAI = sysMonsterAI			--AI系统
	self.LineInfo = nil
	self.dwRoleID = 0
	self.dwLastMove = 0;
	self.dwMoveDelay = 1000;
	self.dwLevel = 0
	self.EscortPlayer = {}
	self.dwSearchDelay = 3000
	self.dwLastSearch = 0
	self.MatchPlayer = {}
	--self.dwSendPosDelay = 10*1000;
	self.dwLastSend = 0;
	self.dwBornTime = 0;
	
	self.dwLastCheckLeader = 0;--上一次发现会长在身边的时间
end
--进入
function CMonsterAIGuildEscort:Enter(LineInfo,dwLevel,dwRoleID,EscortPlayer,MatchPlayer,szGuildName,dwBornTime)
	self.LineInfo = {}
	for i=1,#LineInfo do
		self.LineInfo[i] = LineInfo[i]
	end
	self.dwRoleID = dwRoleID
	self.dwLevel = dwLevel
	self.EscortPlayer = EscortPlayer or {}
	self.MatchPlayer = MatchPlayer or {}
	self.objMon.OnDead = function(_,dwRoleID) self:OnDead(dwRoleID) end
	self.objMon.OnHurt = function(mon,objEnemy) self:OnHurt(mon,objEnemy) end
	
	local dwNow = GetCurTime();
	self.dwBornTime = dwBornTime or dwNow;
	self.dwLastCheckLeader = dwNow;
	
	self.szMyGuildName = szGuildName;
	--根据公会名字而改变名字
	local szMonName = self.objMon:GetName();
	szMonName = string.format(SysStringConfigInfo[6001010202],szGuildName,szMonName);
	self.objMon:SetSendData(1,szMonName);
	self.objMon:GetMgr():InsertEscortNode(self.objMon:GetRoleID(),self.objMon)
end
--更新
function CMonsterAIGuildEscort:SlowUpdate()
	--lw：镖车进入无敌状态，表示已经到达终点
	if self.objMon.isNotHurt then
		return;
	end
	
	local dwNowTime = GetCurTime()
	if dwNowTime - self.dwLastSend > GuildEscortConfig.dwEscortSendPosTick then
		self.dwLastSend = dwNowTime
		self:SendPos()
	end
	if dwNowTime - self.dwBornTime - GuildEscortConfig.dwFailTime > 1 then
		local mgrMon = self.objMon.Map:GetMonsterMgr()
		mgrMon:DelGuildMonster(self.objMon:GetGuildID())
		self:SendRes(1)
		return;
	end
	if self.dwBornTime + GuildEscortConfig.dwFailTime - dwNowTime < 10*60*1000 then
		self:SendNotice(6001071007)
	end
	if dwNowTime-self.dwLastSearch>self.dwSearchDelay then
		self.dwLastSearch = dwNowTime
		local Player = self.objMon.Map:GetMonsterCanSeePlayer(self.objMon)
		for dwRoleID,_ in pairs(Player) do
			if self.EscortPlayer[dwRoleID] then
				self.MatchPlayer[dwRoleID] = (self.MatchPlayer[dwRoleID] or 0) + 1
			end
		end
	end
	if dwNowTime - self.dwLastMove < self.dwMoveDelay then return end
	if self.objMon:GetSystem("CMonsterMoveSystem"):IsMoving() then return end;
	self.dwLastMove = dwNowTime
	local PosMon = self.objMon:GetVectorPos()
	if math.sqrt((PosMon.x-self.LineInfo[1].fin.x)^2+(PosMon.y-self.LineInfo[1].fin.y)^2)<self.LineInfo[1].round then
		table.remove(self.LineInfo,1)
		if self.LineInfo[1] then--有下一张地图
			local NewMap = CMapManager:GetMap( self.LineInfo[1].mapid )
			local NewmgrMon = NewMap:GetMonsterMgr()
			NewmgrMon:AddGuildMonster(self.objMon:GetGuildID(),self.dwLevel,dwHp,self.LineInfo,self.dwRoleID,self.EscortPlayer,self.MatchPlayer,self.szMyGuildName,self.dwBornTime)
			local mgrMon = self.objMon.Map:GetMonsterMgr()
			mgrMon:DelGuildMonster(self.objMon:GetGuildID())
			
			local szMapName = "";
			if MapInfoConfig[self.LineInfo[1].mapid] then
				szMapName = MapInfoConfig[self.LineInfo[1].mapid].szName;
			end
			self:SendNotice(6001071012,{szMapName});
		else--到达终点
			self:SendRes(0)
			self.objMon:Say(SysStringConfigInfo[6001071102]);
			self.objMon.isNotHurt = true;
			
			local mgrMon = self.objMon.Map:GetMonsterMgr()
			local f = function() mgrMon:DelGuildMonster(self.objMon:GetGuildID()) end
			CDelayerManager:Delay(eDelay._10sec,f)
		end
		return
	end
	local Map = self.objMon.Map
	local objPlayer = Map:GetPlayerByRoleID(self.dwRoleID)
	if not objPlayer then
		--self:SendNotice(6001071002)
		self:NoticeLeaderLength(dwNowTime);
		return
	end
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local PosPlayer = sysMap:GetPlayerPos()
	if math.sqrt((PosMon.x-PosPlayer.x)^2+(PosMon.y-PosPlayer.y)^2)<GuildEscortConfig.dwFollowDis then
		if math.sqrt((PosMon.x-PosPlayer.x)^2+(PosMon.y-PosPlayer.y)^2)>2 then
			local path = Map:GetPath(PosMon,PosPlayer)
			if path then
				self.objMon:GetSystem("CMonsterMoveSystem"):StartMove(path[2].x,path[2].y)
			end
			self.dwLastCheckLeader = dwNowTime;
		end
	else
		--self:SendNotice(6001071002)
		self:NoticeLeaderLength(dwNowTime);
	end
end
--离开
function CMonsterAIGuildEscort:Exit()
	self.objMon:GetMgr():RemoveEscortNode(self.objMon:GetRoleID())
end
-------------------------------------------------
--事件
function CMonsterAIGuildEscort:OnDead(dwRoleID)
	local objPlayer = CMapManager:GetPlayer(dwRoleID)
	local szRoleName = objPlayer:GetInfo().szRoleName
	local objSystem = objPlayer:GetSystem('CGuildSystem')
	local szGuildName = objSystem:GetGuildName()
	if szGuildName then
		self:SendNotice(6001071005,{szGuildName,szRoleName})
	else
		self:SendNotice(6001071011,{szRoleName})
	end
	self:SendRes(2)
end
function CMonsterAIGuildEscort:OnHurt(mon,objEnemy)
	self:SendNotice(6001071003)
	local dwMaxHP = self.objMon:GetMaxHP()
	local dwCurHP = self.objMon:GetHP()
	if dwCurHP/dwMaxHP < 0.25 then
		self:SendNotice(6001071004)
	end
	
	local szName = objEnemy:GetName();
	local szStr = SysStringConfigInfo[6001071100];
	szStr = string.format(szStr,szName);
	self.objMon:Say(szStr);
end
-------------------------------------------------
--方法
--向KS返回押镖结果
--dwRsl:0--成功；1--超时；2--死亡
function CMonsterAIGuildEscort:SendRes(dwRsl)
	local dwGuildID = self.objMon:GetGuildID();
	local dwRes = dwRsl;
	local Player = {};
	if dwRes == 0 then
		Player = self.MatchPlayer
	end
	CGuildServerMsg:NotifyKernel('EscortFinish',dwGuildID,dwRes,Player)
end
--向Clt同步位置
function CMonsterAIGuildEscort:SendPos()
	local dwMapID,fPosX,fPosY = self.objMon:GetPos()
	local dwHp = self.objMon:GetHP()
	local dwMaxHp = self.objMon:GetMaxHP()
	for dwRoleID,_ in pairs(self.EscortPlayer) do
		local objPlayer = CMapManager:GetPlayer(dwRoleID)
		if objPlayer then
			local sysGuild = objPlayer:GetSystem('CGuildSystem')
			sysGuild:Msg():NotifyClient('OnEscortMove',dwHp,dwMaxHp,dwMapID,fPosX,fPosY)
		end
	end
end
--向KS发送提示信息
function CMonsterAIGuildEscort:SendNotice(dwStringID,tabArgv)
	self.tabNoticeCoolDown = self.tabNoticeCoolDown or {}
	local dwCoolDown = GuildEscortConfig.Notice[dwStringID]
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
	CGuildServerMsg:NotifyKernel('EscortNotice',dwGuildID,dwStringID,tabArgv)
end
--发现会长距离过远
function CMonsterAIGuildEscort:NoticeLeaderLength(dwNowTime)
	local dwDis = dwNowTime - self.dwLastCheckLeader;
	if dwDis < GuildEscortConfig.dwNoticeLeaderLength then
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
	
	if self:SendNotice(6001071002,args) then
		self.objMon:Say(SysStringConfigInfo[6001071101]);
	end
end;
-------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIGuildEscort)







