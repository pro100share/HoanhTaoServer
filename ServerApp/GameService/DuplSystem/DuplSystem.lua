--[[
功能：副本系统类
作者：曲莹
时间：2012-03-07 
]]

_G.CDuplSystem = {};
function CDuplSystem:new()
	local obj = CSystem:new("CDuplSystem");
	obj.dwCurMapID = 0 ; --玩家当前所在地图，用来记录
	obj.objDBQuery = nil;    --对应的数据库操作模块
	obj.dwEntityId = 0;
	for i,v in pairs(CDuplSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end; 
	return obj;
end;


function CDuplSystem:Create(bIsChangeLine)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.dwTotalTime = 0;
	self.EnterFbInfo = {};
	self.DuplInfo = {};
	self.DuplEnterTimeInfo = {};
	self.ZLPlanNum = 0;
	self.IsDupling = false;       ---是否在副本中
	self.PullDownFlag = 0;
	self.ChangeLineState = 0;   --0:正常换线  1:进入副本  2:离开副本
	self.dwUpdateTime = 0;
	self.StopRecTime = true;
	self.UpdateFlag = false;
	local objDB = objPlayer:GetDBQuery();
	if not objDB then
		return false;
	end;
	self.zlBossTbl = {};--记录珍珑棋局死亡boss
	self.objDBQuery = CDuplSystemDB:new(objDB, self);
	if bIsChangeLine == 0 then
	--if not bIsChangeLine then
		local duplInfo = objPlayer:GetLineData("CDuplSystem")[1];
		if duplInfo then
			local enteredInfo = duplInfo[1];
			self:SetEnteredTimeInfo(enteredInfo);
			--珍珑副本进度
			local zlPlan = duplInfo[2];
			self:SetZlPlan(zlPlan);
			local jiFenData = duplInfo[3];
			self:SetFbJiFen(jiFenData);
			--珍珑打过的bossInfo
			local hitedBossInfo = duplInfo[4];
			self:SetHitedBossInfo(hitedBossInfo);
		end;
	end;
	
	return true;
end;
function CDuplSystem:Update(dwInterval)
	if self.UpdateFlag then return end;
	
	if self.objCurDupl then
		local duplId = self.objCurDupl.dwCfgID;
		if _G.DuplConfig[self.objCurDupl.dwCfgID].SetOpenTime then
			local now = GetCurTime();
			if not self.lastTime then	
				self.lastTime = GetCurTime();
			end;
			
			if not self.StopRecTime then
				self.dwUpdateTime = self.dwUpdateTime + (now - self.lastTime);
				if self.dwUpdateTime >= _G.DuplConfig[self.objCurDupl.dwCfgID].dwCloseFbTime * 60000 then
					self:SetDuplUpdateFlag();
				end;
			end
			
			self.lastTime = now;
		end;
	end;
end;

function CDuplSystem:SetDuplUpdateFlag()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	-- print("CDuplSystem:SetDuplUpdateFlag========6", objPlayer:GetName())
	
	--如果是大乱斗直接结束
	if self.objCurDupl.bIsDaLuanDou then
		-- print("CDuplSystem:SetDuplUpdateFlag========66")
		--self:WoHuCangLongLeave();
		return;
	end
	
	self.UpdateFlag = true;
	
	if self.objCurDupl.m_WinFlag then
		return;
	end
	
	if self:WoHuCangLongLeaveCheck() then
		self:WoHuCangLongLeave();
	end
end;


--卧虎藏龙离开条件检查
function CDuplSystem:WoHuCangLongLeaveCheck()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return true;
	end;
	
	--检查队伍中所有队员
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then
		return true;
	end;
	
	local teamMate = teamSystem:GetTeamLeaguer();
	local member = nil;
	local bIsSomeoneInDupl = false;
	local bIsAliveInDupl = false;
	
	if teamMate then
		for _, memberId in pairs(teamMate) do
			if objPlayer:GetRoleID() ~= memberId then
				member = objPlayer:GetOtherPlayer(memberId, 3);
			else
				member = objPlayer;
			end;
		
			local battleSystem = member:GetSystem("CBattleSystem");
			local mapSystem = member:GetSystem("CMapSystem");
			local deadFlag = battleSystem.dwDeadFlag;
			local _, mapCfgId = mapSystem:GetCurMapID();
			local _, duplMapId = DuplConfig[self.objCurDupl.dwCfgID].MapSet();
			--如果有玩家在副本中
			if mapCfgId == duplMapId then
				bIsSomeoneInDupl = true;
				if deadFlag ~= 1 then
					bIsAliveInDupl = true;
					--检查是否还有怪物存在
					local map = mapSystem:GetCurMap();
					local monstMgr = map:GetMonsterMgr();
					local countBoss = monstMgr:GetMonNum().dwBoss;
					if countBoss >= 1 then
						return false;
					end
				end
			end
		end;
	end;
	-- print("CDuplSystem:WoHuCangLongLeaveCheck bIsSomeoneInDupl, bIsAliveInDupl", bIsSomeoneInDupl, bIsAliveInDupl)
	--可以结束
	if bIsSomeoneInDupl and not bIsAliveInDupl then
		self.objCurDupl:SetTollWin(false);
	end
	return true;
end

--设置卧虎藏龙副本状态
function CDuplSystem:SetTollWin(b_Win)
	self.objCurDupl:SetTollWin(b_Win);
end

--获取队长的副本系统 (卧虎藏龙副本的流程由队长控制)
function CDuplSystem:GetCaptaionDuplSys()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	--获取队长
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then
		--_err("Can not get teamSystem by CDuplSystem:EnterDuplFb");
		return false;
	end;
	local captainId = teamSystem:GetCaptainId();
	local captain = objPlayer;
	if captainId then
		if captainId ~= objPlayer:GetRoleID() then
			captain = objPlayer:GetOtherPlayer(captainId, 3);
		end
	end
	return captain:GetSystem("CDuplSystem");
end

--卧虎藏龙离开副本 发奖励
function CDuplSystem:WoHuCangLongLeave()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	--卧虎藏龙副本停止刷怪
	if DuplConfig[self.objCurDupl.dwCfgID].DaojishiOver then
		DuplConfig[self.objCurDupl.dwCfgID]:DaojishiOver(objPlayer);
	end
	
	self:WoHuCangLongAward();
	self.objCurDupl:ShowCountDown();
	--self:ReqLeaveFbScene(false);
	local duplSystem = self:GetCaptaionDuplSys();
	if not duplSystem then
		_err("CDuplSystem:WoHuCangLongLeave cant get captainDuplSys!!");
		return;
	end
	
	duplSystem.dwUpdateTime = 0;
	duplSystem.UpdateFlag = false;
	duplSystem.StopRecTime = true;
end

--卧虎藏龙奖励
function CDuplSystem:WoHuCangLongAward()
	--如果不是卧虎藏龙副本就返回
	if not _G.DuplConfig[self.objCurDupl.dwCfgID].SetOpenTime then
		return;
	end
	
	if self.objCurDupl.m_WinFlag then
		self.objCurDupl:SendWinAward();
	else
		local tollGateNum = self.objCurDupl:GetTollGateNum();
		local winFlag = self.objCurDupl:GetTollWin();
		local dwMoney = _G.GetTollGateMoney(tollGateNum, winFlag);
		for _, system in pairs(self.objCurDupl.SystemTbl) do
			if system then	
				local itemSystem = system:GetPlayer():GetSystem("CItemSystem");
				if not itemSystem then
					return;
				end;
				
				--卧虎藏龙副本是否给过失败奖励
				system.bWoHuCangLongSendAward = true;
				if dwMoney and dwMoney > 0 then
					itemSystem:AddPacketMoney(dwMoney, _G.ItemSysOperType.FuBenReward);  --银两
				end;
			end;
		end;
	end
end

--boss死亡
function CDuplSystem:OnBossDeadCheck()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.objCurDupl then
		return;
	end;
	
	local duplSystem = self:GetCaptaionDuplSys();
	if not duplSystem then
		_err("CDuplSystem:OnBossDeadCheck cant get captainDuplSys!!");
		return;
	end
	
	if duplSystem.UpdateFlag then
		self:WoHuCangLongLeave();
		return;
	end
	
	duplSystem.StopRecTime = true;
	local tollGateNum = duplSystem:GetTollGateNum()
	if tollGateNum ~= 0 then
		local teamMate = objPlayer:GetSystem("CTeamSystem"):GetTeamLeaguer();
		local member = nil;
		if teamMate then
			for _, memberId in pairs(teamMate) do
				if objPlayer:GetRoleID() ~= memberId then
					member = objPlayer:GetOtherPlayer(memberId, 3);
					member.SendTollGateMsg{TollNum = tollGateNum, bIsShow = false};
				else
					member = objPlayer;
					member.SendTollGateMsg{TollNum = tollGateNum, bIsShow = true};
				end;
			end
		end
	end;
end;

function CDuplSystem:SetTollGateNum(dwNum)
	if self.objCurDupl then
		self.objCurDupl:SetTollGateNum(dwNum)
	end;
end;
function CDuplSystem:GetTollGateNum()
	if not self.objCurDupl then
		return 0;
	end;
	return self.objCurDupl:GetTollGateNum()
end;

--检测副本相关死亡
function CDuplSystem:OnDead(dwEnemyType,dwEnemyID)
	--有副本,在副本中,不是任务副本
	if self.objCurDupl then
		if _G.DuplConfig[self.objCurDupl.dwCfgID].bInShow ~= 0 or _G.ChallengeQunXiaConfig.IsQunXiaFB(self.objCurDupl.dwCfgID) then
			if self:IsInDupl() then
				self.objCurDupl:SetDeadNum();
				
				--如果是自杀群侠副本不给奖励
				if dwEnemyType == -1 or dwEnemyID == 0 then return end
				--如果是群侠副本 角色死亡直接判定挑战失败
				if _G.ChallengeQunXiaConfig.IsQunXiaFB(self.objCurDupl.dwCfgID) then
					--如果副本已经胜利 人物死亡不判定失败也不发送失败奖励
					if self.objCurDupl.m_WinFlag then
						return
					end
					local objPlayer = self:GetPlayer();
					if not objPlayer then
						return;
					end;
					
					--发送失败奖励
					objPlayer:GetSystem("CChallengeQunXiaSystem"):SendFailAward(self.objCurDupl.dwCfgID)
				end
				if DuplConfig[self.objCurDupl.dwCfgID].SetOpenTime then
					local duplSystem = self:GetCaptaionDuplSys();
					if not duplSystem then
						_err("CDuplSystem:OnDead cant get captainDuplSys!!");
						return;
					end
					--如果副本时间未到
					if not duplSystem.UpdateFlag then
						return
					end
					-- print("CDuplSystem:OnDead==========6=========")
					if self:WoHuCangLongLeaveCheck() then
						-- print("CDuplSystem:OnDead==========7=========")
						self:WoHuCangLongLeave();
					end						
				end;
			end;
		end;
	end;
end;
--珍珑棋局进度
function CDuplSystem:SetZlPlan(zlPlan)
	self.ZLPlanNum = zlPlan;
end;
--记录自己的积分
function CDuplSystem:SetFbJiFen(jiFenData)
	self.JiFenRecord = jiFenData;
end;
--function CDuplSystem:GetFbJiFen()
	--return self.JiFenRecord;
--end;
--获得珍珑棋局进度
function CDuplSystem:GetZlPlan()
	return self.ZLPlanNum;
end;

--设置已经打过的珍珑boss
function CDuplSystem:SetHitedBossInfo(bossInfo)
	self.hitBossInfo = bossInfo;
end;
function CDuplSystem:SetMapData()
	if self.objCurDupl then
		local duplId = self.objCurDupl.dwCfgID;
		if duplId and _G.DuplTbl[duplId] then
			local mapsInfo = self.objCurDupl.maps;
			for dwMapId, map in pairs(mapsInfo) do
				if map then
					map.bosssiwang01 = nil;
					map.bosssiwang02 = nil;
					map.bosssiwang03 = nil;
					map.bosssiwang04 = nil;
					map.bosssiwang05 = nil;
					map.bosssiwang06 = nil;
					map.bosssiwang07 = nil;
					map.bosssiwang08 = nil;
					map.bosssiwang09 = nil;
					map.bosssiwang10 = nil;
					map.bosssiwang11 = nil;
					map.bosssiwang12 = nil;
					map.bosssiwang13 = nil;
				end;
			end;
		end;
	end;
end;
--获得打过的boss信息
function CDuplSystem:GetHitedBossInfo()	
	return self.hitBossInfo;
end;
--记录副本次数
function CDuplSystem:SetEnteredTimeInfo(duplInfo)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if duplInfo then
		for _, info in pairs(duplInfo) do
			if info then	
				local todayTime = GetCurTime();
				local enteredTime = info.dwDateTimes;
				local _, _, s_Hour, s_Minute = string.find(_G.ClearTime, "(%d*):(%d*)");
				local hour = tonumber(s_Hour);
				local mins = tonumber(s_Minute);
				local todayFlushTime = CTimeFormat:GetTodayThisTimeMsec(hour, mins);
				if todayTime < todayFlushTime then
					todayFlushTime = todayFlushTime - 86400000;--24 * 60 * 60 * 1000;
				end;
				if todayFlushTime >= enteredTime then
					if DuplConfig[info.dwDuplId].types == "day" then
						--self.objDBQuery:DelDuplInfo(dwRoleID, info.dwDuplId)
						self.objDBQuery:UpdateDuplEnterTime(dwRoleID, info.dwDuplId)
						self.DuplEnterTimeInfo[info.dwDuplId] = 0;
					else
						self.DuplEnterTimeInfo[info.dwDuplId] = info.dwTimes;
					end;
				else
					self.DuplEnterTimeInfo[info.dwDuplId] = info.dwTimes;
				end;	
			end;
		end;
	end;
end;

--剧情副本下线的处理
function CDuplSystem:DoneDuplWithOffLine()
	if not self.Info then
		return;
	end
	if self.objCurDupl then
		if DuplConfig[self.objCurDupl.dwCfgID].bInShow == 0 then    --剧情本
			local tbInfo = {};	
			tbInfo.dwCurMapID = self.Info.dwMapId;
			tbInfo.fXPos = self.Info.dwPosx;
			tbInfo.fYPos = self.Info.dwPosy;
			tbInfo.fDirValue = math.random(0,6);
			return tbInfo;
		end;
	end;
end;

function CDuplSystem:Destroy()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then
		local duplId = self.objCurDupl.dwCfgID;
		if DuplConfig[duplId].bInShow ~= 0 then    --剧情本
			--发放奖励
			local name = objPlayer:GetInfo().szRoleName;
			local roleId = objPlayer:GetInfo().dwRoleID;
			if self.PullDownFlag == 0 and (self.objCurDupl and self.objCurDupl.m_WinFlag) then
				self:RandomGetAward(name, roleId);
			end;
			self:DoDestroyDupl(objPlayer:GetRoleID())
			self:ExitDupl() --默认是要退出副本的
			--玩家下线更新珍珑boss进度数据库
			self.objDBQuery:UpdateZLBossInfo(objPlayer:GetRoleID(), self:GetHitedBossInfo());
		end;
	end;
end;

function CDuplSystem:DoDestroyDupl(roleId)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	if self.objCurDupl then
		local dupl = self.objCurDupl;
		local duplId = dupl.dwCfgID;
		local entityId = dupl:GetFbEntityId();
		self:BackMapByExit();
		--下线时删除副本内副本系统的注册信息
		-- if not self.objCurDupl then
			-- _err("self.objCurDupl is nil by destroy");
		-- end;
		dupl:DeleteDuplSystem(self);
		dupl:SetLeaveTime();
		if dupl:GetDuplType() == 0 and not dupl.m_WinFlag then
			CDuplManager:AddDesDupl(roleId, entityId);
		end;
	end;
end;

--退出系统的时候，返回到线的地图上
function CDuplSystem:BackMapByExit()
	--执行副本外（自己所在線）地图上的复活点
	local objMe = self:GetPlayer();
	if not objMe then
		--_err("error objMe is null by CDuplSystem:Destroy");
		return;
	end;
	local sysMap = objMe:GetSystem("CMapSystem");
	if not sysMap then
		--_err("error sysMap is null by CDuplSystem:Destroy");
		return;
	end;

	local objMap = CMapManager:GetMap(sysMap.dwCurMapID);
	if not objMap then
		--_err("objMap Error");
		return nil;
	end; 
	
	local sPoint = objMap:GetRelivePoint(); 
	if not sPoint then
		--_err("sPoint null");
		return nil;
	end;
	self:ExecExitDupl(sysMap.dwCurMapID,sPoint.dwID); 
end;

--进入场景后同步副本信息
function CDuplSystem:OnEnterScene()
	self:GetFbTimes();
end;

--开始换线记录数据
function CDuplSystem:OnChangeLineBegin(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	
	local tbl = {};
	table.insert(tbl, self.DuplEnterTimeInfo);
	table.insert(tbl, self.ZLPlanNum);
	table.insert(tbl, self.JiFenRecord);
	table.insert(tbl, self:GetHitedBossInfo());
	table.insert(tbl, self.ChangeLineState);
	table.insert(tbl, self.EnterDuplId);
	table.insert(tbl, self.EnterEntityId);
	table.insert(tbl, self.Info);
	table.insert(tbl, self.isEnter);
	self.EnterDuplId = dwDuplId;
	self.EnterEntityId = dwDuplEntityId;
	objPlayer:SetLineData("CDuplSystem",tbl);
end;
--换线结束获得数据
function CDuplSystem:OnChangeLineEnd(dwNewLineID)
	local objPlayer = self:GetPlayer()
	if not objPlayer then
		return;
	end;
	local getInfo = objPlayer:GetLineData("CDuplSystem")[1];
	self.DuplEnterTimeInfo = getInfo[1];
	self.ZLPlanNum = getInfo[2];
	self.JiFenRecord = getInfo[3];
	self:SetHitedBossInfo(getInfo[4]);
	--换线副本相关
	-----------------------------------------------------------------
	self.ChangeLineState = getInfo[5];
	self.EnterDuplId = getInfo[6];
	self.EnterEntityId = getInfo[7];
	self.Info = getInfo[8]; 
	-----------------------------------------------------------------
	self:GetFbTimes();
	objPlayer.NoticeClientClearMsg{};
	if self.ChangeLineState == 1 then
		self:DoEnterPlayerDupl(self.EnterDuplId, self.EnterEntityId)
	elseif self.ChangeLineState == 2 then
		local objMapSys = objPlayer:GetSystem("CMapSystem");
		if not objMapSys then
			return;
		end;
		objMapSys.dwCurMapID = self.Info.dwMapId;
		objMapSys.fXPos = self.Info.dwPosx;
		objMapSys.fYPos = self.Info.dwPosy;
		objMapSys.fDirValue = math.random(0,6);
		objMapSys.isMustReload = true;
		self.objCurDupl = nil;
		
		self.ChangeLineState = 0;
	end;
end;
-----------------------------------------------------------------------------------------------------
-------------------------------------------公共方法--------------------------------------------
-----------------------------------------------------------------------------------------------------
function CDuplSystem:JudgeEnterCondition(dwDuplID)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:JudgeEnterCondition");
		return false;
	end;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	if not teamSystem then
		_err("Can not get teamSystem by CDuplSystem:JudgeEnterCondition");
		return;
	end;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置
	if not cfDupl then
		return false;
	end;
	if objMe:GetLevel() < cfDupl.dwPlayerMinLevel or  objMe:GetLevel() > cfDupl.dwPlayerMaxLevel then--判断等级
		self:ShowMsgInfo(SysStringConfigInfo[9000610031], true);
		return false;
	end;
	return true;
end;

--ks返回的entityId
function CDuplSystem:ResponseDuplOrder(duplEntityId, dwDuplID, recordTbl)	
	
	--获得指定副本数据
	if _G.DuplTbl[dwDuplID] then
		CDuplManager:SetZLDuplRecord(recordTbl);
	end;
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	local teamMemberNums = teamSystem:GetTeamPersonNum() or 0;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置 
	if not cfDupl then
		_err("cfDupl is nil by ResponseDuplOrder", dwDuplID);
		return;
	end;
	if self.objCurDupl then
		objMe.ClearFbEnterReqMsg{};
		return;
	end;
	local maxLevel = teamSystem:GetMaxMemberLevel();
	local objDupl = CDupl:new(objMe:GetRoleID(),dwDuplID,cfDupl.dwPlayerCount, duplEntityId, DuplConfig[dwDuplID].fbDifficity[teamMemberNums] , maxLevel, teamMemberNums); 
	if objDupl then
		objDupl:SetLifeTime();
		self.objCurDupl = objDupl; --记录刚刚创建的副本 
		if not DuplConfig[dwDuplID].SetOpenTime then
			local Time = {};
			local CycleType
				= _G.CAlarmTaskCycleType.eMinute ;
			local CycleTime = DuplConfig[objDupl.dwCfgID].dwCloseFbTime;
			local CycleTime1 = DuplConfig[objDupl.dwCfgID].dwCloseFbTime - DuplConfig[objDupl.dwCfgID].dwCountDownTime / 60;
			local RunTimes = 1;

			local Param = {objDupl};
		
			--清除其他队友的该副本信息	
			local duplLifeIndex = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, objDupl.DelFbWhenOver, Param);
			local duplLifeIndex1 = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime1, RunTimes, objDupl.ShowCountDown, Param);
			objDupl:SetDuplCreateAlock(duplLifeIndex);
			objDupl:SetDuplTsAlock(duplLifeIndex1);
			self:TeamMateaRegFbSys(objDupl);
		else
			--CDuplManager:RegisterFbSys(objDupl, self)
			self.StopRecTime = true;
		end;
	else
		_info("---------new dupl failed-----", dwDuplID);
		return false;
	end;
	local mapSet = cfDupl.MapSet();
	if _G.ChallengeQunXiaConfig.IsQunXiaFB(dwDuplID) then
		self.dwMapID = mapSet[1];
		
		local newMapInfo = MapInfoConfig[self.dwMapID];
		if not newMapInfo then
			--_err("newMapInfo id error",dwMapID);
			return false;
		end;
		local newPoint = newMapInfo.point[self.dwPointID];
	
		--改变自己的地图属性
		self.fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的x位置
		self.fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的Y位置
		self.fDirValue = math.random(0,6);   --玩家的方向
	end
	if not objDupl:Create(mapSet) then 
		return false;
	end;
	if not CDuplManager:AddDupl(objDupl) then 
		return false;
	end; 
	self:DoEnterDupl(dwDuplID, duplEntityId, self.itemEnum);
end;

local function IsInDays(day, dayTbl)
	for _, values in pairs(dayTbl) do
		if values == day then
			return true;
		end;
	end;
	return false;
end;

--获得副本等级
function CDuplSystem:GetDuplLevel()
	if self.objCurDupl then
		return self.objCurDupl:GetLevel();
	end;
	return 0;
end;

--记录进入副本的次数,时间
function CDuplSystem:NoteEnterFbTimes(dwDuplID, entityId, itemEnum, objDupl)
	local objMe = self:GetPlayer();
	if not objMe then	
		return false;
	end;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	local itemSystem = objMe:GetSystem("CItemSystem");
	if not teamSystem then
		_err("Can not get teamSystem by CDuplSystem:NoteEnterFbTimes");
		return;
	end;
	if not itemSystem then
		_err("Can not get itemSystem by CDuplSystem:NoteEnterFbTimes");
		return;
	end;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置  
	if not cfDupl then
		return;
	end;
	if cfDupl.dwEnterTimes then
		if objDupl and not objDupl:GetIsEntered(objMe:GetRoleID()) then	
			local doFlag, times = self.objDBQuery:GetEnterFbTimes(dwDuplID, entityId, self.DuplEnterTimeInfo[dwDuplID]);
			if not doFlag then
				local dwCounts, _, _ = itemSystem:GetEnumItemNumInPacket(itemEnum);
				if dwCounts > 0 then
					doFlag = true;
					itemSystem:DelEnumItemInPacket(itemEnum, 1, false, _G.ItemSysOperType.Used);
					self.objDBQuery:UpdateEnterTimes(dwDuplID, entityId, self.DuplEnterTimeInfo[dwDuplID] or 0);
				end;
			end;
			self.DuplEnterTimeInfo[dwDuplID] = times;
			if not doFlag then
				self:ShowMsgInfo(SysStringConfigInfo[9000610030], true);
				return false;
			end;
			objMe.SynEnterFbInfoMsg{DuplId = dwDuplID, Times = times}
		end;
	end;
	
	local dwOpenDay = cfDupl.dwOpenDay;
	local dwFbStartTime = cfDupl.dwFbStartTime;
	local dwFbEndTime = cfDupl.dwFbEndTime;
	local _, _, startHour, startMin = string.find(dwFbStartTime, "(%d*).(%d*)");
	local _, _, endHour, endMin = string.find(dwFbEndTime, "(%d*).(%d*)");
	local startTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(startHour), tonumber(startMin));
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	--判断星期
	if not IsInDays(CTimeFormat:toweekEx(GetCurTime()), dwOpenDay) then
		return false;
	end;
	if GetCurTime() < startTime or GetCurTime() > endTime then
		teamSystem:OperSystemNotice(SysStringConfigInfo[9000610028], true);
		return false;
	end;
	return true;
end;

--与判断能否进入副本
function CDuplSystem:FirstJudgeNoteTime(dwDuplID)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end; 
	local fbItemProp = DuplConfig[dwDuplID].fbItemProp;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	local itemSystem = objMe:GetSystem("CItemSystem");
	if not teamSystem then
		_err("Can not get teamSystem by CDuplSystem:FirstJudgeNoteTime");
		return;
	end;
	if not itemSystem then
		_err("Can not get itemSystem by CDuplSystem:FirstJudgeNoteTime");
		return;
	end;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置  
	if not cfDupl then
		_err("cfDupl is nil", dwDuplID);
		return;
	end;
	if cfDupl.dwEnterTimes then
		local times = self.DuplEnterTimeInfo[dwDuplID] or 0;
		if times >= cfDupl.dwEnterTimes then
			if times >= cfDupl.dwEnterTimes + cfDupl.addTimes then
				self:ShowMsgInfo(SysStringConfigInfo[9000610019], true);
				return false;
			else
				objMe.ReqUsePropMsg{DuplId = dwDuplID};
				return false;
			end;
		end;
	end;
	local dwOpenDay = cfDupl.dwOpenDay;
	local dwFbStartTime = cfDupl.dwFbStartTime;
	local dwFbEndTime = cfDupl.dwFbEndTime;
	local _, _, startHour, startMin = string.find(dwFbStartTime, "(%d*).(%d*)");
	local _, _, endHour, endMin = string.find(dwFbEndTime, "(%d*).(%d*)");
	local startTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(startHour), tonumber(startMin));
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	--判断星期
	if not IsInDays(CTimeFormat:toweekEx(GetCurTime()), dwOpenDay) then	
		return false;
	end;
	if GetCurTime() < startTime or GetCurTime() > endTime then
		self:ShowMsgInfo(SysStringConfigInfo[9000610028], true);
		return false;
	end;
	return true;
end;
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

--提供给外部系统调用，进入副本请求（start）
function CDuplSystem:EnterDupl(dwDuplID, itemEnum)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	self:CreateAndEnterDupl(dwDuplID, itemEnum);
end; 
--检测队友是否还有副本
function CDuplSystem:CheckTeamMateHaveFb()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRoleId = objPlayer:GetRoleID();
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	local teamMate = teamSystem:GetTeamLeaguer();
	if teamMate then
		for _, memberId in pairs(teamMate) do
			if dwRoleId ~= memberId then
				local member = objPlayer:GetOtherPlayer(memberId, 3);
				local duplSystem = member:GetSystem("CDuplSystem");
				if member and duplSystem then
					if duplSystem.objCurDupl then
						if DuplConfig[duplSystem.objCurDupl.dwCfgID].bInShow ~= 0 then    --剧情本
							return true;
						end;
					end;
				end;
			end;
		end;
	end;
	return false;
end;
--请求创建和进入副本
function CDuplSystem:CreateAndEnterDupl(dwDuplID, itemEnum)
	-- print("CDuplSystem:CreateAndEnterDupl==============6")
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:CreateAndEnterDupl");
		return;
	end;
	--获取组队系统
	local teamSys= objMe:GetSystem("CTeamSystem");
	if not teamSys then
		_err("Can not get teamSys by CDuplSystem:CreateAndEnterDupl");
		return false;
	end; 

	--队长/无队伍的副本系统
	local sysCaptDupl;
	--获取队长
	local dwCaptainID = teamSys:GetCaptainId(); 
	if dwCaptainID then
		local objCaptain = objMe:GetOtherPlayer(dwCaptainID,3);
		if DuplConfig[dwDuplID].bInShow == 0 then    --剧情本
			self:ShowMsgInfo(SysStringConfigInfo[9000610016], true)
			return;
		end;
		local teamMates = teamSys:GetTeamPersonNum();
		--检测组队人数
		if teamMates > DuplConfig[dwDuplID].dwPlayerCount then
			self:ShowMsgInfo(SysStringConfigInfo[9000661102], true);
			return;
		end;
		if not objCaptain or not objCaptain.GetSystem then
			_err("Can not get objCaptain by CDuplSystem:CreateAndEnterDupl", dwCaptainID);
			return false;
		end;
		sysCaptDupl = objCaptain:GetSystem("CDuplSystem"); 
	else
		sysCaptDupl = objMe:GetSystem("CDuplSystem");
	end;
	
	--队长/单人有没有副本
	if not sysCaptDupl.objCurDupl then --如果副本不存在
		--如果是队长
		if dwCaptainID then
			if dwCaptainID == objMe:GetRoleID() then
				if self:CheckTeamMateHaveFb() then
					self:ShowMsgInfo(SysStringConfigInfo[9000661045], true);
					objMe.ClearFbEnterReqMsg{};
					return;
				end;
				-- print("CDuplSystem:CreateAndEnterDupl==============7")
				CKernelApp.DuplMgr_GetIdMsg{_aid = objMe.dwAccountID, DuplId = dwDuplID};
			else	
				local captain = objMe:GetOtherPlayer(dwCaptainID, 3);
				if captain:GetSystem("CTeamSystem") then
					local str = string.format(SysStringConfigInfo[9000610036], objMe:GetInfo().szRoleName);
					captain:GetSystem("CDuplSystem"):ShowMsgInfo(str, true);
				end;
				objMe.ClearFbEnterReqMsg{};
			end; 
		else 
			-- print("CDuplSystem:CreateAndEnterDupl==============8")
			CKernelApp.DuplMgr_GetIdMsg{_aid = objMe.dwAccountID, DuplId = dwDuplID};
		end;
	else
		-- 如果是通天塔副本 放过去（因为可以再来一次）
		if _G.TongTianTowerConfig.IsTongTianTowerFB(dwDuplID) then
			_info("tongTianTower repeat~~~~2");
		elseif self.objCurDupl and self.ExitDuplId == 0 then
			_info("----server repeat enter dupl--------", self.objCurDupl.dwCfgID, self.ExitDuplId);
			return;
		end; 
		self.objCurDupl = sysCaptDupl.objCurDupl;
		self:DoEnterDupl(dwDuplID, sysCaptDupl.objCurDupl.entityId, itemEnum)
		-- print("CDuplSystem:CreateAndEnterDupl==============9")
	end;
	-- 王凌波添加，专为战旗用
	self.bPlayerInDuplArea = true;
end;

--注册队友的副本信息
function CDuplSystem:TeamMateaRegFbSys(objDupl)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	self.DuplLife = GetCurTime();
	CDuplManager:RegisterFbSys(objDupl, self)
	local teamSystem = objMe:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	local teamMates = teamSystem:GetTeamMembers();
	if teamMates then
		for _, memberId in pairs(teamMates) do			
			local member = objMe:GetOtherPlayer(memberId, 3);  --获得当前先队友信息
			if member then
				local duplSystem = member:GetSystem("CDuplSystem");
				if duplSystem then
					duplSystem.DuplLife = GetCurTime();
				end;
			end;
		end;
	end;
end;

--进入副本
function CDuplSystem:DoEnterDupl(dwDuplID, fbEntityId, itemEnum)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end; 
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置
	if not cfDupl then
		_err("--DoEnterDupl-----duplId error---", dwDuplID);
		return;
	end;
	local flag = self:NoteEnterFbTimes(dwDuplID, fbEntityId, itemEnum,  self.objCurDupl);
	if not flag then
		return false;
	end;
	local objDupl = nil;
	if self.objCurDupl then
		if self.objCurDupl.dwCfgID ~= dwDuplID then--不能进入非自己创建的副本
			self:ShowMsgInfo(SysStringConfigInfo[9000610012], true);
			objMe.ClearFbEnterReqMsg{};
			return false;
		end; 
		if self.objCurDupl.entityId ~= fbEntityId then
			_info("entityId error", self.objCurDupl.entityId, fbEntityId);
			return false;
		end;
		objDupl = self.objCurDupl;
	else--不是自己创建的
		local teamSys= objMe:GetSystem("CTeamSystem");
		if not teamSys then
			return false;
		end; 
		--获取队长
		local dwCaptainID = teamSys:GetCaptainId();
		if not dwCaptainID then
			return false;
		end;
		local objCaptain = objMe:GetOtherPlayer(dwCaptainID, 3);--获取队长
		if not objCaptain then
			return false;
		end;
		local sysCaptDupl = objCaptain:GetSystem("CDuplSystem");
		if not sysCaptDupl then
			return false;
		end;
		if not sysCaptDupl.objCurDupl then
			return false;
		end;
		objDupl = sysCaptDupl.objCurDupl;
		--self.objCurDupl = objDupl;--记录副本
	end; 
	if not objDupl then
		return false;
	end;
	self.objCurDupl = objDupl;
	if not CDuplManager:EnterDupl(self.objCurDupl, objMe) then
		return false;
	end; 
	--执行脚本
	if not cfDupl:EnterEvent(objMe) then
		return false;
	end; 
	self:ExecEnterCreateLater(dwDuplID);
end;
-------------------------------------------------------------------------
---请求进入副本(通过面板提示队友进入)
function CDuplSystem:EnterDuplFb(dwDuplID)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then
		--_err("Can not get teamSystem by CDuplSystem:EnterDuplFb");
		return false;
	end;
	local captainId = teamSystem:GetCaptainId();
	if captainId then
		local captain = objPlayer:GetOtherPlayer(captainId, 3);	
		if captain then
			local duplSystem = captain:GetSystem("CDuplSystem");
			if duplSystem then
				self:ReqEnterDupl(duplSystem.dwDuplID,duplSystem.dwCurMapID, 1, 2)
			end;
		end;
	end;
end;
--退出副本
function CDuplSystem:ExitDupl()
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	if not self.objCurDupl then
		-- _info("---ExitDupl self.objCurDupl is nil---");
	end;
	CDuplManager:ExitDupl(objMe, self.objCurDupl);	
	self.IsDupling = false;
end;

--获得副本的id
function CDuplSystem:GetDuplId()
	if self.objCurDupl then
		return self.objCurDupl.dwCfgID;
	end;
	return nil;
end;
--获得副本对象
function CDuplSystem:GetDuplObj()
	return self.objCurDupl;
end;

--提供给脚本执行的进入副本
----默认是dwMapID：0当前地图--出生点ID
function CDuplSystem:ExecEnterDupl(dwDuplID,dwMapID,dwPointID, itemEnum)
    local newMapInfo = MapInfoConfig[dwMapID];
	if not newMapInfo then
		--_err("newMapInfo id error",dwMapID);
		self:SendChangeMapResult(-1);
		return false;
	end;
	local newPoint = newMapInfo.point[dwPointID];
	self.dwPointID = dwPointID;
	--改变自己的地图属性
	
	local fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的x位置
	local fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的Y位置
	local fDirValue = math.random(0,6);   --玩家的方向
	return self:ExecEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue, itemEnum)
end;

function CDuplSystem:RecordEnterDupl(dwDuplID, roleId)
	local flag = false;
	if self.objCurDupl then
		for _, info in pairs(self.objCurDupl.EnterPlayerTbl) do
			if info[1] == roleId then
				flag = true;
			end;
		end;
	end;
	return flag;
end;

function CDuplSystem:SynEnteredDuplInfo(duplId, teamMode)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SetEnteredDuplMsg{DuplId = duplId, EnterMode = teamMode};
end;

function CDuplSystem:ExecEnterCreateLater(dwDuplID)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;	
	local teamSystem = objMe:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	local map = self.objCurDupl.map;
	local dwLineID = 0;    --副本实体id
	
	if not self.objCurDupl  then
		_info("self.objCurDupl is nil by CDuplSystem:ExecEnterDuplXY", dwDuplID);
		return;
	end
	dwLineID = self.objCurDupl:GetFbEntityId();
	if self.DuplLife then
		-- if DuplConfig[dwDuplID].SetOpenTime then
			-- local times = DuplConfig[dwDuplID].dwCloseFbTime * 60 * 1000 - (GetCurTime() - self.DuplLife);
			-- objMe.EnterDuplSetTimeMsg{Time = times};
			-- objMe.EnterDuplMsg{DuplID = dwDuplID, Time = times, ZLDuplInfo = CDuplManager:GetZLDuplRecord(), ZLPlanNum = self.ZLPlanNum, Score = map:GetIntegral(objMe) or 0};
			-- self:ResGetFbShowInfo(true);
		-- else
		self:SetDuplBossPlan();
		local times = DuplConfig[dwDuplID].dwCloseFbTime * 60 * 1000 - (GetCurTime() - self.DuplLife);
		objMe.EnterDuplMsg{DuplID = dwDuplID, Time = times, ZLDuplInfo = CDuplManager:GetZLDuplRecord(), ZLPlanNum = self.ZLPlanNum, Score = map:GetIntegral(objMe) or 0};
		self:ResGetFbShowInfo(true);
		--end;
	elseif DuplConfig[dwDuplID].SetOpenTime then
		objMe.EnterDuplMsg{DuplID = dwDuplID, Time = 0, ZLDuplInfo = CDuplManager:GetZLDuplRecord(), ZLPlanNum = self.ZLPlanNum, Score = map:GetIntegral(objMe) or 0};
		self:ResGetFbShowInfo(true);
	end;
	
	--self.dwMapID = DuplConfig[dwDuplID].MapSet[1];
	if not _G.ChallengeQunXiaConfig.IsQunXiaFB(dwDuplID) then
		--群侠副本在上面已经保存过mapID了
		
		-- 如果是通天塔副本
		local extraParam = nil
		if _G.TongTianTowerConfig.IsTongTianTowerFB(dwDuplID) then
			extraParam = objMe:GetSystem("CTongTianTowerSystem"):GetCurLayer();
		end
		
		local mapSet, dwMapId = DuplConfig[dwDuplID].MapSet(extraParam);
		self.dwMapID = dwMapId;
	end
	
	local mapId = self.objCurDupl.maps[self.dwMapID].DuplMapID;   --dupl map entity id
	--第一个进场的人同步进入的副本信息
	if teamSystem:GetCaptainId() then
		if teamSystem:GetCaptainId() == objMe:GetRoleID() then
			--self.dwDuplID = self.dwDuplID;
			self.dwCurMapID = mapId;
			self.fXPos = self.fXPos;
			self.fYPos = self.fYPos;
			self.fDirValue = self.fDirValue;		
			if self.objCurDupl:GetDuplType() ~= 0 then
				teamSystem:NoticeMemberEnterFb(dwDuplID, 2);
			end;
			local teamMates = teamSystem:GetTeamLeaguer();
			for _, roleId in pairs(teamMates) do
				if roleId == objMe:GetRoleID() then
					objMe.SetEnteredDuplMsg{DuplId = dwDuplID, EnterMode = 2};
				else
					local member = objMe:GetOtherPlayer(roleId, 3);
					if member then
						if member:GetSystem("CDuplSystem") then
							member:GetSystem("CDuplSystem"):SynEnteredDuplInfo(dwDuplID, 2);
						end;
					end;
				end;
			end;
		end;
	else
		objMe.SetEnteredDuplMsg{DuplId = dwDuplID, EnterMode = 1};   --EnterMode：1为单人本，2为多人本
	end;
	
	--改变自己的地图属性   
	local sInfo = 
	{ 
		fXPos = self.fXPos,		--玩家的x位置
		fYPos = self.fYPos,		--玩家的Y位置
		fDirValue = self.fDirValue,   --玩家的方向
		sDuplInfo = {dwMapID = mapId,dwLineID = dwLineID, dwMapCfgId = self.dwMapID};     --mapId为entityId(唯一id),
	};
	--切换地图接口
	local sysMap = objMe:GetSystem("CMapSystem");
	self.mapId = DuplConfig[dwDuplID].ReliveMapId;
	self.posx = DuplConfig[dwDuplID].Posx;
	self.posy = DuplConfig[dwDuplID].Posy;
	self.fDirValue = self.fDirValue;
	self.duplId = dwDuplID;
	self.countDownTime = DuplConfig[dwDuplID].dwCountDownTime;
	local itemSystem = objMe:GetSystem("CItemSystem");
	_info("------enter dupl---------","dwAccountId:"..objMe:GetAccountID(), "playerId:"..objMe:GetRoleID(), "duplId:"..dwDuplID, "enterTime:"..GetCurTime(), "duplEntityId:"..dwLineID);
	sysMap:ExecChangeMap(sInfo);
	
	--卧虎藏龙副本是否已经发过失败奖励
	if DuplConfig[dwDuplID].SetOpenTime then
		self.bWoHuCangLongSendAward = false;
	end
	
	
	--第一次进入副本提示消
	if not self:RecordEnterDupl(dwDuplID, objMe:GetRoleID()) then
		if _G.DuplTbl[dwDuplID] then
			if not itemSystem:CostPacketMoney(_G.EnterDuplSilver[dwDuplID], _G.ItemSysOperType.EnterZLCost) then
				return;
			end;
		end;
		local msg = DuplConfig[dwDuplID].msg;
		self:ShowFbMsgInfo(msg);
		table.insert(self.objCurDupl.EnterPlayerTbl, {objMe:GetRoleID(), objMe:GetInfo().szRoleName, objMe:GetInfo().dwIncoID});
		CLogSystemManager:dupl(objMe, teamSystem:GetTeamId() or 0, dwDuplID, 0)
		if self.objCurDupl then
			local failedBossTbl = self.objCurDupl:GetFailedMonster();
			local duplState = self.objCurDupl:GetRefedMonster();
			objMe.ReturnZLBossMsg{DuplId = dwDuplID, FailedBoss = failedBossTbl, RefedBoss = duplState};
		end;
	end;
	if DuplConfig[dwDuplID].fbInfo ~= "" then
		objMe.ReqShowMsg{};
	end;
	if self.objCurDupl:GetDuplDelAlock() ~= 0 then
		for _, system in pairs(self.objCurDupl.SystemTbl) do
			if system then	
				system:DelDuplFbTask(self.objCurDupl)
			end;
		end;
	end;
	
	if objMe:GetSystem('CPlayerEventCenterSystem') then
		objMe:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventEnterDungeon ,1,dwDuplID);
	end;
	if objMe:GetSystem('CPlayerEventCenterSystem') and _G.EnterDuplEvent[dwDuplID] then
		objMe:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.EnterDuplEvent[dwDuplID]);
	end;
	self.IsDupling = true;
	CDuplManager:RegisterFbSys(self.objCurDupl, self);
	self.DuplInfo = {dwDuplID,self.dwMapID,self.dwPointID};	
	self.ExitDuplId = 0;
end;

--默认是dwMapID：0当前地图
function CDuplSystem:ExecEnterDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue, itemEnum)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	self.dwDuplID = dwDuplID;
	self.fXPos = fXPos;
	self.fYPos = fYPos;
	self.fDirValue = fDirValue;	
	self.dwMapID = dwMapID;
	self.itemEnum = itemEnum;
	self:EnterDupl(dwDuplID, itemEnum);
end;

----默认是dwMapID：0当前地图--出生点ID
function CDuplSystem:ExecExitDupl(dwMapID,dwPointID)
	local newMapInfo = MapInfoConfig[dwMapID];
	if not newMapInfo then
		--_err("newMapInfo id error",dwMapID);
		self:SendChangeMapResult(-1);
		return false;
	end;
	local newPoint = newMapInfo.point[dwPointID];
	
	--改变自己的地图属性
	local fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的x位置
	local fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的Y位置
	local fDirValue = math.random(0,6);   --玩家的方向
	-- print("----------ExecExitDupl------------");
	return self:ExecExitDuplXY(dwMapID,fXPos,fYPos,fDirValue)
end;

--默认是dwMapID：0当前地图
function CDuplSystem:ExecExitDuplXY(dwMapID,fXPos,fYPos,fDirValue)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	if not self.objCurDupl then
		return;
	end;
	self:ExitDupl();
	self.duplId = nil;
	--改变自己的地图属性   
	local sInfo = 
	{ 
		dwMapID =  dwMapID ,
		fXPos = fXPos,		--玩家的x位置
		fYPos = fYPos,		--玩家的Y位置
		fDirValue = fDirValue,   --玩家的方向
	}; 
	--切换地图接口
	local sysMap = objMe:GetSystem("CMapSystem");
	
	if not sysMap:ExecChangeMap(sInfo) then
		return false;
	end;
	if self.objCurDupl then
		self.ExitDuplId = self.objCurDupl.dwCfgID;
		if self.objCurDupl:GetCurCount() <= 0 then
			-- print("===ExecExitDuplXY 2===",self.objCurDupl.CountDownFlag,self.objCurDupl.CanDelFlag)
			if self.objCurDupl.CountDownFlag or self.objCurDupl.CanDelFlag then
				self:DelDuplDirect();
			else
				self:DeleteDuplByTime();
			end;
		end;
	end;
	
	--通知客户端自己退出副本
	objMe.ExitDuplMsg{};
	objMe.IsShowLeaveMsg{};	
	objMe:GetSystem("CMapSystem"):SetMapDuplInfo();
	return true;
end;

--死亡回城复活退出副本，不切换地图
function CDuplSystem:ExecExitDuplByDead()
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	self:ExitDupl();
	self.duplId = nil;
	if self.objCurDupl then
		self.ExitDuplId = self.objCurDupl.dwCfgID;
		if self.objCurDupl:GetCurCount() <= 0 then
			self:DeleteDuplByTime();
		end;
	end;
	--通知客户端自己退出副本
	objMe.ExitDuplMsg{};
	objMe.IsShowLeaveMsg{};	
	objMe:GetSystem("CMapSystem"):SetMapDuplInfo();
	return true;
end;

--副本生命周期结束离开副本
function CDuplSystem:ExitDuplLifeOver(dwMapID,fXPos,fYPos,fDirValue, duplId)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	if not self.objCurDupl then
		return;
	end;
	if not DuplConfig[duplId] then
		return;
	end;

	self.bPlayerInDuplArea = false;
	local nRoleID = objMe:GetRoleID()
	local oBanner = CBannerManager.tAllBanners[nRoleID]
	if oBanner and oBanner.bInDupl then
		CBannerManager:DelBanner(nRoleID);
	end

	self:ExitDupl();
	self.duplId = nil;
	--改变自己的地图属性   
	local sInfo = 
	{ 
		dwMapID =  dwMapID ,
		fXPos = fXPos,		--玩家的x位置
		fYPos = fYPos,		--玩家的Y位置
		fDirValue = fDirValue,   --玩家的方向
	}; 
	
	
	--如果是群侠副本
	-- print("CDuplSystem:ExitDuplLifeOver fbId is ", self.objCurDupl.dwCfgID)
	if _G.ChallengeQunXiaConfig.IsQunXiaFB(self.objCurDupl.dwCfgID) then
		-- print("CDuplSystem:ExitDuplLifeOver+++++++++++++++++++++++++++2")
		local qunXiaSystem = objMe:GetSystem("CChallengeQunXiaSystem");
		if not qunXiaSystem then
			_err("CDuplSystem:ExitDuplLifeOver cant find qunXiaSystem")
		end
		
		local mapInfo = qunXiaSystem:GetMapInfo();
		if not mapInfo then
			_err("CDuplSystem:ExitDuplLifeOver cant find mapInfo")
		end
		
		sInfo = mapInfo;
		qunXiaSystem.mapInfo = nil
		
		
		--self:Back();
		--return;
	end
	
	
	--切换地图接口
	local sysMap = objMe:GetSystem("CMapSystem");
	if not sysMap then
		return;
	end;
	local stateSystem = objMe:GetSystem("CStateSystem");
	local battleSystem = objMe:GetSystem("CBattleSystem");
	if not stateSystem then	
		_err("CStateSystem is nil when ExitDuplLifeOver");
		return;
	end;
	if not battleSystem then
		_err("CBattleSystem is nil when ExitDuplLifeOver");
		return;
	end;
	if stateSystem.dwCurState == enPlayerState.ePS_Dead then
		battleSystem:Relive(enReliveType.eRT_Pos)
	end;
	if not sysMap:ExecChangeMap(sInfo) then
		return false;
	end;
	--通知客户端自己进入副本
	objMe.ExitDuplMsg{};
	-- print("--------DuplTest8-------server", duplId);
	self:DuplLifeOver(duplId)
end;

function CDuplSystem:OnOverDupl(duplId)
	self:DuplLifeOver(duplId)
end;
--??
--副本删除
function CDuplSystem:DuplLifeOver(duplId)
	if self.objCurDupl then
		if duplId and self.objCurDupl.dwCfgID ~= duplId then
			return;
		end;
		local systemTbl = self.objCurDupl.SystemTbl;
		for _, system in pairs(systemTbl) do
			if system == self or (system ~= self and not system:IsInFb()) then 
				system:DeleteFbOper(duplId)
			end;
		end;
	end;
end;

function CDuplSystem:IsInFb()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	return CDuplManager:IsInFb(objPlayer:GetRoleID());
end;

--同步删除副本
function CDuplSystem:DeleteFbOper(duplId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then 
		if DuplConfig[duplId].bInShow == 0 and (not _G.ChallengeQunXiaConfig.IsQunXiaFB(duplId)) then
			self:Back();
		else
			self.objCurDupl:DelAllAlock();
			local flag = self.objCurDupl:HavePlayerInDupl()	
			if not flag then
				self.objCurDupl:EnterDelState();
			end;	
			self.objCurDupl = nil;
			self.ExitDuplId = 0;
			self.DuplInfo = {};
			self.DuplLife = nil;
			objPlayer.ClearFbDelInfoMsg{};
			self.EnterFbFlag = false;
			self.PullDownFlag = 0;			
		end;
	
	end;
end;

--离场定时删除多人副本
function CDuplSystem:DeleteDuplByTime()
	local Time = {};
	local CycleType
		= _G.CAlarmTaskCycleType.eMinute ;
	local CycleTime = DuplConfig[self.objCurDupl.dwCfgID].dwDelFbTime;
	local RunTimes = 1;
	local Param = {self.objCurDupl};
	-- print("===DeleteDuplByTime 1===",self.objCurDupl.dwCfgID,CycleTime)
	--清除其他队友的该副本信息
	if CycleTime > 0 then
		if self.objCurDupl:GetDuplDelAlock() == 0 then
			local duplTaskIndex = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, self.objCurDupl.DelFb, Param);

			self.objCurDupl:SetDuplDelAlock(duplTaskIndex);
			if self.objCurDupl.SystemTbl then
				for _, system in pairs(self.objCurDupl.SystemTbl) do
					if system and system.objCurDupl then
						system:SynFbRestInfo(system.objCurDupl.dwCfgID, system.objCurDupl.entityId, true);
					end;
				end;
			end;
		end;
	else
		self:DelDuplDirect();
	end;
end;

function CDuplSystem:DelDuplDirect()
	-- print("===DelDuplDirect 1===")
	if not self.objCurDupl then
		return;
	end;
	-- print("===DelDuplDirect 2===",self.objCurDupl.SystemTbl)
	if self.objCurDupl.SystemTbl then	
		_G.CAlarmClock:DelTask(self.objCurDupl:GetDuplCreateAlock());
		_G.CAlarmClock:DelTask(self.objCurDupl:GetDuplTsAlock());
		for _, system in pairs(self.objCurDupl.SystemTbl) do
			-- print("===DelDuplDirect 3===",system.objCurDupl)
			if system and system.objCurDupl then
				if DuplConfig[system.objCurDupl.dwCfgID].SetOpenTime then
					if not system.bWoHuCangLongSendAward then
						system:WoHuCangLongAward();
					end
				end
				system.objCurDupl:EnterDelState();
				system.objCurDupl = nil;
				system.DuplInfo = {};
				system.EnterFbFlag = false;
				system.UpdateFlag = false;
				system.StopRecTime = true;
				local objPlayer = system:GetPlayer();
				if objPlayer then
					objPlayer.ClearFbDelInfoMsg{};
					system.PullDownFlag = 0; 
				end;
			end;
		end;
	end;
end;

--删除多人本定时器任务
function CDuplSystem:DelDuplFbTask(dupl)
	if dupl then
		local cfgId = dupl.dwCfgID;
		local entityId = dupl.entityId;
		if self.objCurDupl:GetDuplDelAlock() ~= 0 then
			_G.CAlarmClock:DelTask(self.objCurDupl:GetDuplDelAlock());
			self.objCurDupl:SetDuplDelAlock(0);
		end;
		self:SynFbRestInfo(cfgId, entityId, false);
	end;
end;

--同步副本删除信息
function CDuplSystem:SynFbRestInfo(duplId, entityId, flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self.objCurDupl:SetLeaveTime();
	objPlayer.ReturnFbRestInfoMsg{DuplID = duplId, DuplEntityId = entityId, Flag = flag};	
end;

--更换副本的所属
function CDuplSystem:ChangeBuilder(roleId)
	if self.objCurDupl then
		self.objCurDupl.dwBuilderId = roleId;
	end;
end;
--获得副本实体id
function CDuplSystem:GetNextDuplID()
	self.dwEntityId = self.dwEntityId + 1;
	return self.dwEntityId
end;

--获得进入副本的次数
function CDuplSystem:GetFbTimes()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local roleId = objPlayer:GetRoleID();
	local tbl = {};
	local infoTbl = {};
	local failedBossTbl = {};
	local duplState = true;
	local duplEntityId = CDuplManager:GetLeaveDupl(roleId);
	if duplEntityId then
		local objDupl = CDuplManager:GetDupl(duplEntityId);
		if objDupl and objDupl:GetDuplType() == 0 then
			self.objCurDupl = objDupl; 
			self.objCurDupl.SystemTbl = {};
			CDuplManager:RegisterFbSys(self.objCurDupl, self);
			failedBossTbl = self.objCurDupl:GetFailedMonster();
			duplState = self.objCurDupl:GetRefedMonster();
			local times = self.objCurDupl:GetMonsterTimes();
			self.ExitDuplId = self.objCurDupl.dwCfgID;
			self.DuplLife = self.objCurDupl:GetLifeTime();
			local monsterInfo, bossInfo = self.objCurDupl:GetDuplMonsterInfo();
			table.insert(tbl, {["dwDuplId"] = self.objCurDupl.dwCfgID, ["dwEntityId"] = duplEntityId, ["dwTime"] = GetCurTime() - self.objCurDupl:GetLeaveTime()});	
			table.insert(infoTbl, {["tMonsterInfo"] = monsterInfo, ['tBossInfo'] = bossInfo, ["dwTimes"] = times});
		end;
	end;
	objPlayer.ReturnFbBasicInfoMsg{EnterTimesTbl = self.DuplEnterTimeInfo, OutLineTbl = tbl, InfoTbl = infoTbl, FailedBoss = failedBossTbl, RefedBoss = duplState};
end;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function CDuplSystem:RegisterPlayerEvent(duplId)
	local role = self:GetPlayer();
	if role then
		if role:GetSystem('CPlayerEventCenterSystem') then
			role:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.enumPlayerEventType.EventDungeonBegin,1,duplId);
		end;
	end;
end;

function CDuplSystem:ShowMsgInfo(msg, types)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.ResponseSystemNoticeMsg{Msg = msg, Types = types, ErrorType = 1};
end;

function CDuplSystem:ShowFbMsgInfo(msg)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	msg = msg or "";
	objPlayer.ShowFbSystemMsg{Msg = msg};
end;

-- function CDuplSystem:ShowWndTiShiInfo(msg, duplId)
	-- local objPlayer = self:GetPlayer();
	-- if not objPlayer then
		-- return;
	-- end;
	-- objPlayer.ReqShowWndTiShiInfoMsg{Msg = msg, DuplId = duplId};
-- end;

-----------------------------------------------------------------------------------------------------
--------------------------------------副本结构修改------------------------------------------------------
-----------------------------------------------------------------------------------------------------
function CDuplSystem:ReqEnterDupl(dwDuplID,dwPointID, index)  --index :1为创建，2为返回
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	
	local objWarSystem = objMe:GetSystem("CWarSystem");
	if objWarSystem then
		if objWarSystem.dwCurWarID ~= 0 then
			return;
		end
	end
	
	if not DuplConfig[dwDuplID] then
		return;
	end;
	_info("ReqEnterDupl!!!!!!!!!! ",DuplConfig[dwDuplID].bInShow);
	--任务副本
	if DuplConfig[dwDuplID].bInShow == 0 and (not _G.ChallengeQunXiaConfig.IsQunXiaFB(dwDuplID)) then
		self:CheckPlayerFb(dwDuplID, index);
		return;
	end;
	if not self:FirstJudgeEnterCond(dwDuplID, index) then
		objMe.ClearFbEnterReqMsg{};
		return;
	end;
	self:ReqDupl(dwDuplID,dwPointID, index);
end;

function CDuplSystem:FirstJudgeEnterCond(dwDuplID, index)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置
	if not cfDupl then
		return;
	end;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	if not teamSystem then
		_err("Can not get teamSystem by CDuplSystem:EnterDupl");
		return;
	end;
	if index == 2 then
		if self.objCurDupl then
			if self.objCurDupl.dwCfgID ~= dwDuplID then
				self:ShowMsgInfo(SysStringConfigInfo[9000610012], true);
				return false;
			end;

			--如果是卧虎藏龙副本 需要判断进条件
			if _G.DuplConfig[self.objCurDupl.dwCfgID].SetOpenTime then
				if not self:JudgeEnterCondition(dwDuplID) then
					return false;
				end;
				if not self:FirstJudgeNoteTime(dwDuplID) then
					return false;
				end;
			end
		else
			if teamSystem:GetCaptainId() then    --if 队员初次进入副本
				if teamSystem:GetCaptainId() ~= objMe:GetRoleID() then
					if not self:JudgeEnterCondition(dwDuplID) then
						return false;
					end;
					if not self:FirstJudgeNoteTime(dwDuplID) then
						return false;
					end;
				else
					--9000610036
					local captain = objMe:GetOtherPlayer(teamSystem:GetCaptainId(), 3);
					if captain:GetSystem("CDuplSystem") then
						local str = string.format(SysStringConfigInfo[9000610036], objMe:GetInfo().szRoleName);
						captain:GetSystem("CDuplSystem"):ShowMsgInfo(str, true);
					end;
					
					return false;
				end;
			else
				self:ShowMsgInfo(SysStringConfigInfo[9000610009], true);
				return false;
			end;
		end;
	else
		if index == 1 then
			if not self:JudgeEnterCondition(dwDuplID) then
				return false;
			end;
			if not self:FirstJudgeNoteTime(dwDuplID) then
				return false;
			end;
		end;
	end;
	return true;
end;

function CDuplSystem:WaitForRequest()
	if self.DuplInfo then
		if not self.DuplInfo[1] then
			return true;
		else
			return false;
		end;
	end;	
	return true;
end;

--副本请求
function CDuplSystem:ReqDupl(dwDuplID,dwPointID, index)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.EnterFbFlag then
		self:ShowMsgInfo(SysStringConfigInfo[9000610006], true)
		return;
	end;
	if not DuplConfig[dwDuplID] then
		return;
	end;
	if index == 1 then
		-- 如果是通天塔副本 放过去（因为可以再来一次）
		if _G.TongTianTowerConfig.IsTongTianTowerFB(dwDuplID) then
			_info("tongTianTower repeat~~~~1");
		elseif not self:WaitForRequest() then
			_info("repeat request~~~~");
			return;
		end;
	end;
	local dwMapID = DuplConfig[dwDuplID].EnterMapId;
	self:ExecEnterDupl(dwDuplID,dwMapID,dwPointID);
end;

--同步刚加入队伍的玩家副本信息
function CDuplSystem:SynDelFbInfo(captainId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local captain = objPlayer:GetOtherPlayer(captainId, 3);
	local tbl = {};
	if captain then
		local sysCaptDupl = captain:GetSystem("CDuplSystem"); 
		if sysCaptDupl.objCurDupl then --如果副本存在
			if sysCaptDupl.objCurDupl and sysCaptDupl.objCurDupl:GetDuplType() ~= 0 then
				if sysCaptDupl.objCurDupl:GetDuplDelAlock() ~= 0 then
					table.insert(tbl, {["dwDuplId"] = sysCaptDupl.objCurDupl.dwCfgID, ["dwEntityId"] = sysCaptDupl.objCurDupl.entityId, ["dwTime"] = GetCurTime() - sysCaptDupl.objCurDupl:GetLeaveTime()});
				end;		
			end;
			table.insert(sysCaptDupl.objCurDupl.SystemTbl, self);	
		end;
	end;
	objPlayer.ReturnFbBasicInfoMsg{EnterTimesTbl = {}, OutLineTbl = tbl, InfoTbl = {}, FailedBoss = {}, RefedBoss = true};
end

function CDuplSystem:SynEnterTeamInfo(captainId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local captain = objPlayer:GetOtherPlayer(captainId, 3);
	if not captain then
		return;
	end;
	if not captain:GetSystem("CDuplSystem") then
		return;
	end;
	if not captain:GetSystem("CDuplSystem").objCurDupl then
		return;
	end;
	self.DuplLife = captain:GetSystem("CDuplSystem").DuplLife;
	self:SynEnteredDuplInfo(captain:GetSystem("CDuplSystem").objCurDupl.dwCfgID, 2);
end;

--同步离开队伍的玩家副本信息
function CDuplSystem:SynDelFbInfoByDismiss(roleId)
	local objPlayer = self:GetPlayer();
	if self and self.objCurDupl then
		self.objCurDupl:DelAllAlock();
		--没有人
		if not self.objCurDupl:HavePlayerInDupl() then
			self.objCurDupl:EnterDelState();
		end;
		self.objCurDupl:DeleteDuplSystem(self);
		self.objCurDupl = nil;
		self.ExitDuplId = 0;
		self.DuplInfo = {};
		self.EnterFbFlag = false;
	end;
	if objPlayer then
		objPlayer.ClearFbDelInfoMsg{}
		self.PullDownFlag = 0;  
	end;
end;

function CDuplSystem:SynDelFbInfoByLeave(roleId)
	local objPlayer = self:GetPlayer();
	if self and self.objCurDupl then
		self.objCurDupl:DeleteDuplSystem(self)
		self.objCurDupl = nil;
		self.ExitDuplId = 0;
		self.DuplInfo = {};
		self.PullDownFlag = 0;  
	end;
	if objPlayer then
		objPlayer.ClearFbDelInfoMsg{}
	end;
end;

function CDuplSystem:SynDuplWndInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.ClearFbDelInfoMsg{};
	self.PullDownFlag = 0;  
end

--通过离开队伍离开副本
function CDuplSystem:DealDelFbByLeave(roleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		self:SynDelFbInfoByLeave(roleId);
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if CDuplManager:IsInFb(roleId) then
		if DuplConfig[self.objCurDupl.dwCfgID].bInShow ~= 0 then
			if self.objCurDupl and self.objCurDupl:GetDuplType() > 0 then 
				-- print("--------DuplTest9-------server");
				teamSystem:NoticeClientLeaveFb(true, self.objCurDupl.dwCfgID);
			end;
		end;
	else
		self:SynDelFbInfoByLeave(roleId);
	end;
end;
--副本解散时操作面板及奖励
function CDuplSystem:DuplOperByDismiss(roleId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		self:SynDelFbInfoByDismiss(roleId);
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if CDuplManager:IsInFb(roleId) then
		if DuplConfig[self.objCurDupl.dwCfgID].bInShow ~= 0 then
			if self.objCurDupl and self.objCurDupl:GetDuplType() > 0 then 
				-- print("--------DuplTest10-------server");
				teamSystem:NoticeClientLeaveFb(false, self.objCurDupl.dwCfgID);
			end;
		end;
	else
		self:SynDelFbInfoByDismiss(roleId);
	end;
end;

function CDuplSystem:ReqLeaveFbScene(bFlag)
	--玩家请求离开副本，检测玩家是否在副本中
	if not self:IsInDupl() then
		return;
	end;
	self.bPlayerInDuplArea = false;
	if bFlag then
		self:ExecExitDuplXY(self.mapId,self.posx,self.posy,self.fDirValue)
	else
		self:ExitDuplLifeOver(self.mapId,self.posx,self.posy,self.fDirValue,self.duplId)
	end;
end;

function CDuplSystem:SynDelEnterTimes(sInfo)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;
	for _, duplId in pairs(sInfo) do
		--self.objDBQuery:DelDuplInfo(, duplId)
		self.objDBQuery:UpdateDuplEnterTime(objMe:GetRoleID(), duplId)
		if self.DuplEnterTimeInfo[duplId] then
			self.DuplEnterTimeInfo[duplId] = 0;
		end;
	end;
	local tbl = {};
	for _, info in pairs(_G.DuplConfig) do
		local times = self.DuplEnterTimeInfo[info.dwID] or 0;
		table.insert(tbl, {info.dwID, times});
	end;
	objMe.SynDelEnterTimesMsg{InfoTbl = tbl}
end;

function CDuplSystem:ReqEnterByItem(dwDuplID,dwPointID, index, itemEnum)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	if not _G.DuplConfig[dwDuplID] then
		return;
	end;
	local itemTbl = DuplConfig[dwDuplID].fbItemProp;
	if itemTbl then
		local flag = false;
		for _, info in pairs(itemTbl) do
			if info.dwItemEnum == itemEnum then
				flag = true;
				break;
			end;
		end;
		if not flag then
			_info("Enter Dupl Use ItemEnum wrong", objMe:GetRoleID());
			return;
		end;
	end;
	if not self:JudgeEnterByItem(dwDuplID, itemEnum) then
		return;
	end;
	self:ReqDuplByItem(dwDuplID,dwPointID, index, itemEnum);
end;

--多人本请求
function CDuplSystem:ReqDuplByItem(dwDuplID,dwPointID, index, itemEnum)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if index and index == 1 then
		if not self:WaitForRequest() then
			return;
		end;
	end;
	local dwMapID = DuplConfig[dwDuplID].EnterMapId;
	if index and index ~= 1 then
		return;
	end;
	
	if not self.objCurDupl then   --无生命期的重新创建
		self:ExecEnterDupl(dwDuplID,dwMapID, dwPointID, itemEnum)
	else   
		_err("---use item enter fb error---------", self.objCurDupl.dwCfgID, itemEnum);
	end;
end;

function CDuplSystem:JudgeEnterByItem(dwDuplID, itemEnum)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	if not self:JudgeEnterCondition(dwDuplID) then
		return;
	end;
	if not self:JudgeNoteTimeByItem(dwDuplID, itemEnum) then
		return;
	end;
	return true;
end;

--与判断能否进入副本
function CDuplSystem:JudgeNoteTimeByItem(dwDuplID, itemEnum)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end; 
	local fbItemProp = DuplConfig[dwDuplID].fbItemProp;
	local teamSystem = objMe:GetSystem("CTeamSystem");
	local itemSystem = objMe:GetSystem("CItemSystem");
	if not teamSystem then
		_err("Can not get teamSystem by CDuplSystem:NoteEnterFbTimes");
		return;
	end;
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置  
	local dwOpenDay = cfDupl.dwOpenDay;
	local dwFbStartTime = cfDupl.dwFbStartTime;
	local dwFbEndTime = cfDupl.dwFbEndTime;
	local _, _, startHour, startMin = string.find(dwFbStartTime, "(%d*).(%d*)");
	local _, _, endHour, endMin = string.find(dwFbEndTime, "(%d*).(%d*)");
	local startTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(startHour), tonumber(startMin));
	local endTime = _G.CTimeFormat:GetTodayThisTimeMsec(tonumber(endHour), tonumber(endMin));
	--判断星期
	if not IsInDays(CTimeFormat:toweekEx(GetCurTime()), dwOpenDay) then
		return false;
	end;
	if GetCurTime() < startTime or GetCurTime() > endTime then
		self:ShowMsgInfo(SysStringConfigInfo[9000610028], true);
		return false;
	end;
	if cfDupl.dwEnterTimes then
		local times = self.DuplEnterTimeInfo[dwDuplID] or 0;
		local doFlag = false;
		if times >= cfDupl.dwEnterTimes then
			if times >= cfDupl.dwEnterTimes + cfDupl.addTimes then
				doFlag = false;	
			else
				local dwCounts, _, _ = itemSystem:GetEnumItemNumInPacket(itemEnum);
				if dwCounts > 0 then
					doFlag = true;	
				end;
			end;
		else
			doFlag = true;
		end;
		if not doFlag then			
			self:ShowMsgInfo(SysStringConfigInfo[9000610030], true);
			return false;
		end;
	end;
	return true;
end;

-----------------------------------------------------发副本奖励--------------------------------------
--根据玩家礼金
function CDuplSystem:SetAwardByJiFen()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	if not self.objCurDupl then
		return;
	end;
	local duplId = self.objCurDupl.dwCfgID;
	if DuplConfig[duplId].dwShowJiFen and DuplConfig[duplId].dwShowJiFen ~= 1 then
		return;
	end;
	local jiFen = 0;
	if self.objCurDupl then
		jiFen = self.JiFenRecord[self.objCurDupl.dwCfgID] or 0; 
	end;
	local awardMoney = _G.DuplScoreAwardBase * jiFen;
	if awardMoney > 0 then
		itemSystem:AddBindGold(awardMoney, _G.ItemSysOperType.FuBenReward);
	end;
end;
function CDuplSystem:SendWinAward(duplId, lifeTime, personNum, playerTbl, duplLevel, duplAwardList, duplStartTime, duplAwardLevel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;

	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	local teamId = teamSystem:GetTeamId();
	local buffSystem = objPlayer:GetSystem("CBuffSystem");
	if DuplConfig[duplId].bInShow == 0 and (not _G.ChallengeQunXiaConfig.IsQunXiaFB(duplId)) then  --剧情本,不发奖励
		buffSystem:DelDuplBuff();
		return;
	end;
	local level = objPlayer:GetInfo().dwLevel;
	local jiangLiTbl = DuplConfig[duplId].JiangLi(level);
	local passMoney = jiangLiTbl["PassMoney"];  --钱
	local gold = jiangLiTbl["Gold"]; --礼金
	local zhenqi = jiangLiTbl["Zhenqi"]; --真气
	local exps = jiangLiTbl["Exp"]; --经验
	local jiangLiItem = jiangLiTbl["itemTbl"];  --奖励物品
	
	--如果是卧虎藏龙副本 必须赢副本才有通关奖励 否则只有怪物掉落
	if DuplConfig[duplId].SetOpenTime then
		local tollGateNum = self.objCurDupl:GetTollGateNum();
		local winFlag = self.objCurDupl:GetTollWin();
		local dwMoney = _G.GetTollGateMoney(tollGateNum, winFlag);
		passMoney = passMoney + dwMoney;
	
		--如果没赢 没有通关奖励
		-- if not self.objCurDupl.m_WinFlag then
			-- passMoney = dwMoney;  --钱
			-- gold = 0; --礼金
			-- zhenqi = 0; --真气
			-- exps = 0; --经验
			-- jiangLiItem = {};  --奖励物品
		-- end
	end;
	
	if playerTbl then
		for _, info in pairs(playerTbl) do	
			if info[1] ~= objPlayer:GetRoleID() then	
				local player = objPlayer:GetOtherPlayer(info[1], 3);
				CLogSystemManager:transcript(player, math.floor(duplStartTime /1000), lifeTime, personNum, duplId);
				if player then
					--发消息
					CLogSystemManager:dupl(player, teamId or 0, duplId, 1)
					local playerTeamSystem = player:GetSystem("CTeamSystem");
					local playerBuffSystem = player:GetSystem("CBuffSystem");
					local duplSystem = player:GetSystem("CDuplSystem");
					local playerTeamId = playerTeamSystem:GetTeamId();
					if teamId then
						if playerTeamId and teamId == playerTeamId then
							duplSystem:SendFbOtherAward(player, passMoney, gold, zhenqi, exps, level, duplId, duplAwardList, duplAwardLevel)
							duplSystem:SendRootAward(duplId, info[1], info[2], lifeTime, personNum, jiangLiItem)
							player.ReqShowAwardInfoMsg{Type = 1, DuplId = duplId, LifeTime = lifeTime}						
							duplSystem:SetAwardByJiFen();
							duplSystem.bWoHuCangLongSendAward = true;
						else
							player.ReqShowAwardInfoMsg{Type = 0, DuplId = duplId, LifeTime = lifeTime}
						end;
					end;
					playerBuffSystem:DelDuplBuff();
				end;
			else
				CLogSystemManager:dupl(objPlayer, teamId or 0, duplId, 1)
				CLogSystemManager:transcript(objPlayer, math.floor(duplStartTime /1000), lifeTime, personNum, duplId);
				self:SendFbOtherAward(objPlayer, passMoney, gold, zhenqi, exps, level, duplId, duplAwardList, duplAwardLevel);
				self:SendRootAward(duplId, objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName, lifeTime, personNum, jiangLiItem)
				objPlayer.ReqShowAwardInfoMsg{Type = 1, DuplId = duplId, LifeTime = lifeTime}
				buffSystem:DelDuplBuff();
				self:SetAwardByJiFen();
				self.bWoHuCangLongSendAward = true;
			end			
		end;
	end;
	
	--检测是否是群侠挑战副本 挑战群侠胜利发送广播消息
	if _G.QunXiaBroadConfig.IsNeedBoradCast(duplId) then
		local qunXiaSystem = objPlayer:GetSystem("CChallengeQunXiaSystem");
		qunXiaSystem:BroadcastSuccessMsg()
	end
end;

--发放钱等副本奖励
function CDuplSystem:SendFbOtherAward(player, money, gold, zhenqi, exps, duplLevel, duplId, duplAwardList, duplAwardLevel)
	if not player then
		return;
	end;
	local itemSystem = player:GetSystem("CItemSystem");
	local duplSystem = player:GetSystem("CDuplSystem");
	if not itemSystem then
		return;
	end;
	if not duplSystem then
		return;
	end;
	--duplSystem.PullDownFlag = 0;   ---未领取奖励 
	duplSystem.duplAwardList = duplAwardList;
	if money and money > 0 then
		itemSystem:AddPacketMoney(money, _G.ItemSysOperType.FuBenReward);  --银两
	end;
	if gold and gold > 0 then
		itemSystem:AddBindGold(gold, _G.ItemSysOperType.FuBenReward);   --礼金
	end;
	if zhenqi then
		local objElemSystem = player:GetSystem("CFiveElemSystem");
		if objElemSystem then
			local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()	
			--消耗真气
			objElemSystem:ChangeAttr("dwMetalValue",zhenqi)
			objElemSystem:ChangeAttr("dwWoodValue",zhenqi)
			objElemSystem:ChangeAttr("dwWaterValue",zhenqi)
			objElemSystem:ChangeAttr("dwFireValue",zhenqi)
			objElemSystem:ChangeAttr("dwEarthValue",zhenqi)
			local setData = {
				[1] = {dwCurrent = uItemGold, dwChange = zhenqi};
				[2] = {dwCurrent = uItemWood, dwChange = zhenqi};
				[3] = {dwCurrent = uItemWater, dwChange = zhenqi};
				[4] = {dwCurrent = uItemFire, dwChange = zhenqi};
				[5] = {dwCurrent = uItemEarth, dwChange = zhenqi};
			}
			CLogSystemManager:zhenqi(player, setData, _G.FiveElemSysOperType.Dupl)
		end;
	end;
	if exps then
		player:AddExp(exps);
	end;
	if player:GetSystem('CPlayerEventCenterSystem') and _G.EnterPassEvent[duplId] then
		player:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.EnterPassEvent[duplId]);
	end;
	player.SendFbOtherAwardMsg{DuplLevel = duplLevel or 0, DuplId = duplId, DuplAwardList = duplAwardList, DuplAwardLevel = duplAwardLevel}
end;

function CDuplSystem:SendFailedAward(playerTbl, duplId, lifeTime, personNum, duplStartTime)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local buffSystem = objPlayer:GetSystem("CBuffSystem");
	if DuplConfig[duplId].bInShow == 0 or DuplConfig[duplId].bInShow == 2 then  --剧情本,不发奖励
		buffSystem:DelDuplBuff();
		return;
	end;
	for _, info in pairs(playerTbl) do
		local player = objPlayer:GetOtherPlayer(info[1], 3);
		if player then
			local playerBuffSystem = player:GetSystem("CBuffSystem");
			--发消息
			player.ReqShowAwardInfoMsg{Type = 0, DuplId = duplId, LifeTime = lifeTime}	
			playerBuffSystem:DelDuplBuff();
			CLogSystemManager:dupl(player, player:GetSystem("CTeamSystem"):GetTeamId() or 0, duplId, 2)
		else
		end;
		CLogSystemManager:transcript(player, math.floor(duplStartTime /1000), lifeTime, personNum, duplId);
	end;
end;

function CDuplSystem:WinDupl()
	-- print("CDuplSystem:WinDupl ================")
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local mapSystem = objPlayer:GetSystem("CMapSystem");
	if not mapSystem then
		return;
	end;
	local map = mapSystem:GetCurMap();
	local dwRoleID = objPlayer:GetRoleID();
	local szRoleName = objPlayer:GetInfo().szRoleName;
	if self.objCurDupl then
		local duplId = self.objCurDupl.dwCfgID;
		if self.objCurDupl.m_WinFlag then
			_err("----WinDupl-traceback----", dwRoleID, duplId, self.objCurDupl.entityId, self.objCurDupl:GetLifeTime());
			return;
		end;
		self.objCurDupl.m_WinFlag = true;
		self.objCurDupl:ShowCountDown();
		if self.objCurDupl:GetDuplDefState() then	
			objPlayer.NoticeDuplWinMsg{};
			
			if not _G.ChallengeQunXiaConfig.IsQunXiaFB(duplId) then
				local score = map:GetIntegral(objPlayer) or 0;
				if self.JiFenRecord[duplId] and self.JiFenRecord[duplId] < score then
					self.JiFenRecord[duplId] = score;
				end;
			end
			
			self.objCurDupl:SendWinAward();
			if DuplConfig[duplId].dwShowJiFen and DuplConfig[duplId].dwShowJiFen == 1 then
				self.objDBQuery:UpdateJiFenInfo(dwRoleID, duplId, self.JiFenRecord[duplId] or 0);
				CDuplManager:UpdateJiFenInfo(duplId, self.JiFenRecord[duplId], dwRoleID, szRoleName);
			end;
		end;
	end;
end;

function CDuplSystem:SetDuplState()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then
		self.objCurDupl:SetDuplDefState(false);
	end;
end;

function CDuplSystem:GiveUpDupl(duplId)
	if self.objCurDupl then
		if duplId and self.objCurDupl.dwCfgID ~= duplId then
			return;
		end;
		if self.objCurDupl:HavePlayerInDupl() then
			--提示
			self:ShowMsgInfo(SysStringConfigInfo[9000610007], true);
			return;
		else
			local nRoleID = self:GetPlayer():GetRoleID()
			local oBanner = CBannerManager.tAllBanners[nRoleID]
			if oBanner and oBanner.bInDupl then
				CBannerManager:DelBanner(nRoleID);
			end

			if self.objCurDupl.SystemTbl then
				for _, system in pairs(self.objCurDupl.SystemTbl) do
					if system and system.objCurDupl then
						system:DeleteFbOper(duplId);							
					end;
				end;
			end;	
		end;	
	end;
end;

--杀怪
function CDuplSystem:SetKillNum(dwType, num, monsterId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then
		if DuplConfig[self.objCurDupl.dwCfgID].bInShow ~= 0 then
			self.objCurDupl:SetDuplMonsterInfo(dwType, num, monsterId);
			self:GetAllKillNum();
		end;
	end;
end
function CDuplSystem:GetAllKillNum()
	if self.objCurDupl then
		local monsterInfo, bossInfo = self.objCurDupl:GetDuplMonsterInfo();
		local duplPlayers = self.objCurDupl:GetPlayer();
		if duplPlayers then
			for dwId, objPlayer in pairs(duplPlayers) do
				if objPlayer then
					objPlayer.SendDuplMonsterMsg{MonsterInfo = monsterInfo, BossInfo = bossInfo};
				end;
			end;
		end;
	end;	
end;
--获得经验
function CDuplSystem:SetKillExp(num)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local roleId = objPlayer:GetRoleID();
	if self.objCurDupl then
		self.objCurDupl:SetDuplExpInfo(roleId, num);
		self.objCurDupl:GetDuplExpInfo(roleId);
		local expInfo = self.objCurDupl:GetDuplExpInfo(roleId) or 0;
		objPlayer.SendDuplExpMsg{ExpInfo = expInfo};
	end;
end;
--是否在副本中
function CDuplSystem:IsInDupl()
	return self.IsDupling;
end;

function CDuplSystem:IsInQunXiaDupl()
	return self.IsDupling and _G.ChallengeQunXiaConfig.IsQunXiaFB(self.objCurDupl.dwCfgID);
end

-----------------------------------------------------------------------------------
---------------------------------------剧情本处理----------------------------------
-----------------------------------------------------------------------------------
function CDuplSystem:CheckPlayerFb(dwDuplID, index)
	local mapSet, dwMapID = DuplConfig[dwDuplID].MapSet();
	self.MapSet = mapSet;
	self:ExecEnterPlayerDupl(dwDuplID,dwMapID,1);
end;

--提供给脚本执行的进入副本
----默认是dwMapID：0当前地图--出生点ID
function CDuplSystem:ExecEnterPlayerDupl(dwDuplID,dwMapID,dwPointID)
	if not self.MapSet then
		local mapSet, dwMapID = DuplConfig[dwDuplID].MapSet();
		self.MapSet = mapSet;
	end;
    local newMapInfo = MapInfoConfig[dwMapID];
	if not newMapInfo then
		--_err("newMapInfo id error",dwMapID);
		self:SendChangeMapResult(-1);
		return false;
	end;
	
	local newPoint = newMapInfo.point[dwPointID];
	self.dwPointID = dwPointID;
	--改变自己的地图属性
	
	local fXPos = newPoint.fXPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的x位置
	local fYPos = newPoint.fYPos + math.random(-newPoint.fRange,newPoint.fRange);		--玩家的Y位置
	local fDirValue = math.random(0,6);   --玩家的方向
	return self:ExecEnterPlayerDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
end;

--默认是dwMapID：0当前地图
function CDuplSystem:ExecEnterPlayerDuplXY(dwDuplID,dwMapID,fXPos,fYPos,fDirValue)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end;
	
	local objMapSystem = objMe:GetSystem("CMapSystem");
	local info = {};
	info.dwLine = CKernelApp.dwLineID;
	local dwMapId, dwPosX, dwPosY = objMapSystem:GetPlayerMapPos();
	info.dwMapId = dwMapId;
	info.dwPosx = dwPosX;
	info.dwPosy = dwPosY;
	info.dwDirValue = fDirValue;
	self:EnterPlayerDupl(dwDuplID, info);
end;

--提供给外部系统调用，进入副本请求（start）
function CDuplSystem:EnterPlayerDupl(dwDuplID, info)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:EnterDupl");
		return;
	end;
	self:CreateAndEnterPlayerDupl(dwDuplID, info);
end; 
--请求创建和进入副本
function CDuplSystem:CreateAndEnterPlayerDupl(dwDuplID, info)
	local objMe = self:GetPlayer(); 
	if not objMe then
		_err("Can not get objMe by CDuplSystem:CreateAndEnterDupl");
		return;
	end;
	if self.objCurDupl then
		local str = string.format(SysStringConfigInfo[9000610035], DuplConfig[self.objCurDupl.dwCfgID].fbname);
		self:ShowMsgInfo(str, true);
		return;
	end;
	-- print("===CreateAndEnterPlayerDupl===",dwDuplID)
	--队长/单人有没有副本
	CKernelApp.DuplMgr_GetGutIdMsg{_aid = objMe.dwAccountID, DuplId = dwDuplID, LineID = CKernelApp.dwLineID, Info = info};
end;

function CDuplSystem:ChangeLineEnterDupl(dwDuplId, dwDuplEntityId, info, line)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	
	if line == CKernelApp.dwLineID then
		self.Info = info;
		
		local sysMap = objPlayer:GetSystem("CMapSystem");
		--离开当前地图
		sysMap:DoPlayerExitMap(sysMap:GetCurMap());
		
		--设置新的地图属性
		self:DoEnterPlayerDupl(dwDuplId, dwDuplEntityId);
		--切地图
		if sysMap then
			sysMap:ExecChangeMap();
		end
	else
		self.ChangeLineState = 1;
		self.EnterDuplId = dwDuplId;
		self.EnterEntityId = dwDuplEntityId;
		self.Info = info;
		self.isEnter = true;
		objPlayer:ClientChangeLineReq(line);
	end
end;

--进入副本
function CDuplSystem:DoEnterPlayerDupl(dwDuplID, fbEntityId)
	local objMe = self:GetPlayer();
	if not objMe then
		return false;
	end; 
	local cfDupl = DuplConfig[dwDuplID]; --获取副本配置
	if not cfDupl then
		_err("--DoEnterPlayerDupl-----duplId error---", dwDuplID);
		return;
	end;
	local objDupl = CGutDuplManager:GetGutDupl(fbEntityId) 
	
	if not objDupl then
		return false;
	end;
	self.objCurDupl = objDupl;
	if not CGutDuplManager:EnterGutDupl(self.objCurDupl, objMe) then
		return false;
	end; 
	local map = self.objCurDupl.map;
	local dwLineID = 0;    --副本实体id
	dwLineID = self.objCurDupl:GetFbEntityId();
	
	local dwMapId = self.objCurDupl.dwTempMapId;
	self.dwMapID = dwMapId;
	local mapId = self.objCurDupl.maps[self.dwMapID].DuplMapID;   --dupl map entity id
	local sDuplInfo = {dwMapID = mapId,dwLineID = dwLineID, dwMapCfgId = self.dwMapID};     --mapId为entityId(唯一id),
	
	local mapSystem = objMe:GetSystem("CMapSystem");
	mapSystem.sDuplInfo = sDuplInfo;
	--执行脚本
	if not cfDupl:EnterEvent(objMe) then
		return false;
	end; 

	self:ExecEnterPlayerLater(dwDuplID);
end;
function CDuplSystem:ExecEnterPlayerLater(dwDuplID)
	local objMe = self:GetPlayer();
	if not objMe then
		return;
	end;	
	
	local map = self.objCurDupl.map;
	local dwLineID = 0;    --副本实体id
	
	if not self.objCurDupl  then
		_info("self.objCurDupl is nil by CDuplSystem:ExecEnterPlayerLater", dwDuplID);
		return;
	end
	
	if self.DuplLife then
		local times = DuplConfig[dwDuplID].dwCloseFbTime * 60 * 1000 - (GetCurTime() - self.DuplLife);
		objMe.EnterDuplMsg{DuplID = dwDuplID, Time = times, ZLDuplInfo = {}, ZLPlanNum = 0, Score = map:GetIntegral(objMe) or 0};
		self:ResGetFbShowInfo(true);
	else
		if self.objCurDupl:GetLifeTime() then
			local times = DuplConfig[dwDuplID].dwCloseFbTime * 60 * 1000 - (GetCurTime() - self.objCurDupl:GetLifeTime());
			objMe.EnterDuplMsg{DuplID = dwDuplID, Time = times, ZLDuplInfo = {}, ZLPlanNum = 0, Score = map:GetIntegral(objMe) or 0};
			self:ResGetFbShowInfo(true);
		end;
	end;
	
	local mapId = self.objCurDupl.map.DuplMapID;   --dupl map entity id
	self.dwMapID = self.objCurDupl.map.MapID;
	--第一个进场的人同步进入的副本信息
	objMe.SetEnteredDuplMsg{DuplId = dwDuplID, EnterMode = 1};   --EnterMode：1为单人本，2为多人本
	
	local objMapSys = objMe:GetSystem("CMapSystem");
	if not objMapSys then
		return;
	end;
	
	self.mapId = DuplConfig[dwDuplID].ReliveMapId;
	self.posx = DuplConfig[dwDuplID].Posx;
	self.posy = DuplConfig[dwDuplID].Posy;
	self.fDirValue = self.fDirValue;
	self.duplId = dwDuplID;
	self.countDownTime = DuplConfig[dwDuplID].dwCountDownTime;
	
	objMapSys.dwCurMapID = mapId;
	objMapSys.fXPos = self.Info.dwPosx;
	objMapSys.fYPos = self.Info.dwPosy;
	objMapSys.fDirValue = math.random(0,6);
	self.IsDupling = true;
	
	if not self:RecordEnterDupl(dwDuplID, objMe:GetRoleID()) then
		table.insert(self.objCurDupl.EnterPlayerTbl, {objMe:GetRoleID(), objMe:GetInfo().szRoleName, objMe:GetIncoID()});
		CLogSystemManager:dupl(objMe, objMe:GetSystem("CTeamSystem"):GetTeamId() or 0, dwDuplID, 0)
	end
	
	objMapSys.isMustReload = true;
	CDuplManager:RegisterFbSys(self.objCurDupl, self);
end;
--获得副本内刷怪次数
function CDuplSystem:GetMonsterTimes(duplId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then
		if self.objCurDupl.dwCfgID ~= duplId then
			_err("request duplID don't equal duplId", duplId, self.objCurDupl.dwCfgID);
			return;
		else
			local times = self.objCurDupl:GetMonsterTimes();
			objPlayer.RespMonsterTimesMsg{MonsterTimes = times};
		end;
	else
		_err("Do not have dupl~~~ by GetMonsterTimes");
	end;
end;

---------------------------------------------------------------------------
---------------------------珍珑棋局用怪物----------------------------------
---------------------------------------------------------------------------
function CDuplSystem:SetZLBoss()
	self.zlBossTbl = {};
end;
--self.refreshTime = os.now();
--设置boss时间,副本是否结束
function CDuplSystem:SetBossDeadTime(bossId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local waveId = _G.ZLBossTbl["boss"][bossId];
	table.insert(self.zlBossTbl, bossId);   --记录死亡boss
	self.objCurDupl:SetFailedMonster(bossId);
	local liveTime = GetCurTime() - self.objCurDupl:GetCurWaveBegin();
	self:ChgHitedBossInfo(waveId);
	CDuplManager:UpdateZLRecordInfo(waveId, self.objCurDupl.EnterPlayerTbl[1][1], self.objCurDupl.EnterPlayerTbl[1][2], liveTime, self.objCurDupl.EnterPlayerTbl[1][3])
	if #(self.zlBossTbl) == _G.ZLBossTbl.size then   -- then
		--self:WinDupl();
	else
		if waveId >= 5 and waveId < _G.ZLBossTbl.size and waveId == self:GetZlPlan() then
			self:SetZlPlan(self:GetZlPlan() + 1)
			self:UpdateDuplPlan();
		end;
		objPlayer.NoticeFailedMonsterMsg{MonsterId = bossId, PlanNum = self:GetZlPlan()};
	end;
end;

function CDuplSystem:UpdateDuplPlan()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.objDBQuery then
		return;
	end;
	self.objDBQuery:UpdateZLPlan(self.ZLPlanNum)
end;

--刷新怪物
function CDuplSystem:RefMonster(duplId, waveId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDupl = DuplConfig[duplId];
	if not objDupl or not waveId then
		return;
	end;
	if waveId < 1 or waveId > 13 then
		_info("Refresh ZL BOSS Num Wrong", objPlayer:GetRoleID(), waveId);
		return;
	end;
	if waveId > self.ZLPlanNum then
		_info("Refresh ZL BOSS wrong", objPlayer:GetRoleID(), waveId, self.ZLPlanNum);
		return;
	end;
	objDupl:RefreshMonster(objPlayer,waveId);
	self.objCurDupl:SetRefedMonster(waveId);
	self.objCurDupl:SetCurWaveBegin();
end;
--------------------------------------副本奖励宝箱内容------------------------------------
function CDuplSystem:ReqBXItemInfo(goldBXFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwDropID = _G.BXDropId[goldBXFlag];
	if not dwDropID then
		return;
	end;
	self.dwDropID = dwDropID;
	local tRewardItem = CDropControl:DoDrop(dwDropID);
	local tFlyItem = {}
	local awardItem = {};
	for _,v in ipairs(tRewardItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(awardItem,tItem);
		table.insert(tFlyItem,v.dwItemEnum);
	end;
	self.awardItem = awardItem;
	objPlayer.SendBXItemInfoMsg{TFlyItem = tFlyItem};
end;
--发放奖励
function CDuplSystem:ReqGetAward(goldBXNum)
--function CDuplSystem:ReqGetAward(goldBXFlag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.duplAwardList then
		return;
	end;
	local goldBXFlag = self.duplAwardList[goldBXNum]
	if self.PullDownFlag == 1 then
		return;
	end;
	local name = objPlayer:GetInfo().szRoleName;
	local roleId = objPlayer:GetInfo().dwRoleID
	if not self.dwDropID then
		if _G.BXDropId[goldBXFlag] then
			self.dwDropID = _G.BXDropId[goldBXFlag];
		else
			return;
		end;
	end;
	local tRewardItem = CDropControl:DoDrop(self.dwDropID);
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	if not self.awardItem then
		local awardItem = {};
		for _,v in ipairs(tRewardItem) do
			local tItem = {
				dwItemEnum	= v.dwItemEnum;
				dwItemNumber= v.dwNum;
				dwBindType	= v.dwBindType;
			};
			table.insert(awardItem,tItem);
		end;
		self.awardItem = awardItem;
	end;
	local bFlag = itemSystem:AddEnumItemListToPacket(self.awardItem or {}, _G.ItemSysOperType.FuBenReward);
	if not bFlag then
		CDuplManager:SendFbAward(self.awardItem or {}, name, roleId);
		return
	else	
		objPlayer.NoticeFlyIconMsg{};
	end;
	self.PullDownFlag = 1;   ---领取奖励 
end;
--掉线随即发放奖励
function CDuplSystem:RandomGetAward(name, roleId)
	local dwDropID = 0;
	if self.dwDropID then
		dwDropID = self.dwDropID;
	else
		local seed = math.random(1, 5);
		--改成金银铜
		if self.duplAwardList[seed] then
			dwDropID = _G.BXDropId[self.duplAwardList[seed]]
		else
			return;
		end;
	end;
	local tRewardItem = CDropControl:DoDrop(dwDropID);
	--加入玩家背包
	local tabAddList = {}
	for _,v in ipairs(tRewardItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(tabAddList,tItem);
	end
	CDuplManager:SendFbAward(tabAddList, name, roleId);
	self.PullDownFlag = 1;
end;
								
function CDuplSystem:SendRootAward(duplId, roleId, roleName, lifeTime, personNum, jiangLiItem)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local awardItem = {};
	for _,v in ipairs(jiangLiItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwItemNumber;
			dwBindType	= v.dwBindType;
		};
		table.insert(awardItem,tItem);
	end;
	
	local bFlag = itemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.FuBenReward);
	if not bFlag then
		CDuplManager:SendAward(duplId, roleId, roleName, lifeTime, personNum, jiangLiItem);
	end;
end;

function CDuplSystem:ReqSendAward()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local name = objPlayer:GetInfo().szRoleName;
	local roleId = objPlayer:GetInfo().dwRoleID
	if self.PullDownFlag == 0 then
		self:RandomGetAward(name, roleId);
		objPlayer.NoticeClientClearMsg{};
	end;
end;
--请求偷看，消耗元宝
function CDuplSystem:ReqPeepSuss()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if not itemSystem then
		return;
	end;
	local result = false;
	if _G.WasteType == 1 then
		result = itemSystem:CostGold(_G.WasteGold, _G.ItemSysOperType.FuBenReward);
	else
		result = itemSystem:CostBindGold(_G.WasteGold, _G.ItemSysOperType.FuBenReward);
	end;
	objPlayer.NoticeShowViewMsg{Result = result}
end;

function CDuplSystem:CheckSendJiFen()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if not self.objCurDupl then
		return;
	end;
	if self.objCurDupl.m_WinFlag then
		return;
	end;
	if not self.objCurDupl:GetDuplDefState() then
		return;
	end;
	return true;
end;


---------------------------------------------------------------------------------
------------------------------获得副本积分和最快时间-----------------------------
---------------------------------------------------------------------------------
function CDuplSystem:ResGetFbShowInfo(flag)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local recordInfo = CDuplManager:GetDuplRecord();
	objPlayer.ResDuplRecordInfoMsg{RecordInfo = recordInfo, Flag = flag};
	local jiFenInfo = CDuplManager:GetJiFenRecord();
	local num = 0;
	for duplId, info in pairs(jiFenInfo) do
		num = num + 1;
	end;
	local curNum = 1;
	for duplId ,info in pairs(jiFenInfo)  do
		objPlayer.ResSendJiFenMsg{JiFenInfo = info,DuplId = duplId, Flag = flag, EndFlag = (curNum == num)};
		curNum = curNum + 1;
	end;
end;

local function ParseStr(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local key = tonumber(str1);
		t[key] = true;	
	end;
	return t;
end;

--打开珍珑界面时向服务端获得的信息
function CDuplSystem:GetZLInfo()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local hitBossInfo = self:GetHitedBossInfo();
	self.HitBossInfo = hitBossInfo;
	local zlKingInfo = CDuplManager:GetZLKingInfo(); 
	objPlayer.SendZLInfoMsg{HitBossInfo = hitBossInfo, ZLKingInfo = zlKingInfo};
end;

function CDuplSystem:SetDuplBossPlan()
	if not _G.DuplTbl[self.objCurDupl.dwCfgID] then
		return;
	end;
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	self:SetZLBoss()
	if self.objCurDupl then
		local tbl = ParseStr(self.HitBossInfo);
		for bossId, index in pairs(_G.ZLBossTbl["boss"]) do
			if tbl[index] then
				local waveId = index;
				table.insert(self.zlBossTbl, bossId);   --记录死亡boss
				self.objCurDupl:SetFailedMonster(bossId);					
			end;
		end;
	end;
end;

function CDuplSystem:ChgHitedBossInfo(waveId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	local info = self:GetHitedBossInfo()..waveId..";";
	self:SetHitedBossInfo(info);
	self.objDBQuery:UpdateZLBossInfo(dwRoleID, info);
	objPlayer.SendHitedBossChgMsg{WaveId = waveId};
end;
--机器人演武截堂刷怪
function CDuplSystem:CreateMonsterByRobot()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local sysNpc =  objPlayer:GetSystem("CNPCSystem")
	local sysMap = objPlayer:GetSystem("CMapSystem")
	local Map = sysMap:GetCurMap()
	local Npc = Map:GetNpcByObjID(50711001)
	if not Npc then return end;
	local tbFun = Npc.tbFun
	if tbFun and tbFun["zkn"] then
		tbFun["zkn"](Npc,objPlayer,sysNpc,Param,objPlayer:GetSystem("CScriptSystem"))
	end;
end;

function CDuplSystem:NoticeMsg(msg)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	objPlayer.SendNoticeMsg{Msg = msg};
end;

--回到原来
function CDuplSystem:Back()
	local objPlayer = self:GetPlayer();
	if not self.Info then
		--修复OldInfo
		self.Info = {};
		self.Info.dwLine = 1;
		
		--修复的Map点，这个是保证存在且可靠的
		local dwRepaireMapID = ResetMapInfoByError.dwMapID;
		local tbCfg = MapInfoConfig[dwRepaireMapID];
		local tbPoint = tbCfg.point[ResetMapInfoByError.dwPointID]
		
		self.Info.dwMapId = dwRepaireMapID;
		self.Info.fMyPosX = tbPoint.fXPos;
		self.Info.fMyPosY = tbPoint.fYPos;
	end
	if self.objCurDupl then
		self.ExitDuplId = self.objCurDupl.dwCfgID;
		if self.objCurDupl:GetCurCount() <= 0 then
			if self.objCurDupl.CountDownFlag or self.objCurDupl.CanDelFlag then
				self:DelDuplDirect();
			end;
		end;
	end;
	--通知客户端自己退出副本
	objPlayer.ExitDuplMsg{};
	objPlayer.IsShowLeaveMsg{};	
	objPlayer:GetSystem("CMapSystem"):SetMapDuplInfo();
	objPlayer.ClearFbDelInfoMsg{};
	--跳线
	self.ChangeLineState = 2;
	local objDupl = self.objCurDupl
	self.isEnter = true;
	self.objCurDupl = nil;
	self.ExitDuplId = 0; 
	self.DuplInfo = {};
	self.DuplLife = nil;
	self.EnterFbFlag = false;
	self.PullDownFlag = 0;	
	objPlayer:ClientChangeLineReq(self.Info.dwLine);
	objDupl:EnterDelState()
end;

--获得副本类型
function CDuplSystem:GetDuplType()
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	if self.objCurDupl then
		local duplId = self.objCurDupl.dwCfgID;
		return DuplConfig[duplId].bInShow;
	end;
end;

function CDuplSystem:IsNeedChangeLine()
	local dwType = self:GetDuplType();
	
	if not dwType then
		return false;
	end
	
	if dwType ~= 0 then
		return false;
	end
	
	if not self.Info then
		return false;
	end
	
	if self.Info.dwLine == CKernelApp.dwLineID then
		return false;
	end
	
	return true;
end;

function CDuplSystem:TryExitCurDupl()
	if self:IsNeedChangeLine() then
		self:Back();
	else
		local sysMap = self:GetPlayer():GetSystem("CMapSystem");
		sysMap:ExecExitDuplXY(1001,32.74,-18.06,4.5);
	end
end;

------------------------------
--群侠挑战系统用
function CDuplSystem:LeaveDuplByDel()
	if not self.objCurDupl then
		return;
	end;
	-- if self:IsNeedChangeLine() then
		-- self:Back();
	-- else
		-- local sysMap = self:GetPlayer():GetSystem("CMapSystem");
		-- sysMap:ExecExitDuplXY(self.mapId,self.posx,self.posy,self.fDirValue);
	-- end
	
	
	local objMe = self:GetPlayer();
	
	local qunXiaSystem = objMe:GetSystem("CChallengeQunXiaSystem");
	if not qunXiaSystem then
		_err("CDuplSystem:ExitDuplLifeOver cant find qunXiaSystem")
	end
	
	local mapInfo = qunXiaSystem:GetMapInfo();
	if not mapInfo then
		_err("CDuplSystem:ExitDuplLifeOver cant find mapInfo")
	end
	
	local sInfo = mapInfo;
	qunXiaSystem.mapInfo = nil
	
	--切换地图接口
	local sysMap = objMe:GetSystem("CMapSystem");
	if not sysMap then
		return;
	end;

	-- 王凌波添加，专为战旗用
	self.bPlayerInDuplArea = false;
	local nRoleID = objMe:GetRoleID()
	local oBanner = CBannerManager.tAllBanners[nRoleID]
	if oBanner and oBanner.bInDupl then
		CBannerManager:DelBanner(nRoleID);
	end

	--self.objCurDupl:DelFbWhenOver();
	sysMap:ExecExitDuplXY(sInfo.dwMapID,sInfo.fXPos,sInfo.fYPos,sInfo.fDirValue);


end;

-------------------------------------------------------------------------------------------------------------
---------------------------------------------------副本一键完成功能------------------------------------------
-------------------------------------------------------------------------------------------------------------
function CDuplSystem:CompleteDupl(dwDuplId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if self.objCurDupl then
		local msg = SysStringConfigInfo[13009500105];
		self:ShowMsgInfo(msg, true);
		return;
	end;
	local dwCaptainID = teamSystem:GetCaptainId();
	if dwCaptainID then
		local objCaptain = objPlayer:GetOtherPlayer(dwCaptainID, 3);--获取队长
		if objCaptain then
			if objCaptain:GetSystem("CDuplSystem").objCurDupl then
				local msg = SysStringConfigInfo[13009500105];
				self:ShowMsgInfo(msg, true);
				return;
			end;
		end;
	end;
	local cfgDupl = DuplConfig[dwDuplId]; --获取副本配置 
	if not cfgDupl then
		_err("CompleteDupl cfDupl is nil", dwDuplId);
		return;
	end;
	--不支持组队本
	if cfgDupl.showEnterType == 1 or cfgDupl.showEnterType == 3 then
		--一键完成只支持单人副本
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	if objPlayer:GetLevel() < cfgDupl.dwPlayerMinLevel or objPlayer:GetLevel() > cfgDupl.dwPlayerMaxLevel then--判断等级
		return;
	end;
	local enteredTime = self.DuplEnterTimeInfo[dwDuplId] or 0;
	local enterTime = cfgDupl.dwEnterTimes;
	local addTime = cfgDupl.addTimes;
	local costGold = cfgDupl.CompleteDuplCost;
	if not itemSystem:IsGoldEnough(costGold) then
		return;
	end;
	local jiangLiTbl = cfgDupl.JiangLi(objPlayer:GetInfo().dwLevel);
	local completeRate = cfgDupl.CompleteRate;
	local passMoney = math.ceil(jiangLiTbl["PassMoney"] * completeRate);  --钱
	local gold =  math.ceil(jiangLiTbl["Gold"] * completeRate); --礼金
	local zhenqi =  math.ceil(jiangLiTbl["Zhenqi"] * completeRate); --真气
	local exps =  math.ceil(jiangLiTbl["Exp"] * completeRate); --经验
	local jiangLiItem = jiangLiTbl["itemTbl"];  --奖励物品
	local randomSeed = math.random(1,3);
	local dwDropID = _G.BXDropId[randomSeed];
	local tRewardItem = CDropControl:DoDrop(dwDropID);
	local randomAwardItem = {};
	for _,v in ipairs(tRewardItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= v.dwNum;
			dwBindType	= v.dwBindType;
		};
		table.insert(randomAwardItem,tItem);
	end;
	
	
	if enteredTime < enterTime then
		--扣钱发奖励加次数
		itemSystem:CostGold(costGold, _G.ItemSysOperType.CompleteDupl)
		
		if not self.DuplEnterTimeInfo[dwDuplId] then
			self.objDBQuery:AddDuplInfo(objPlayer:GetRoleID(), dwDuplId, 1)
		else
			if self.objCurDupl then
				self.objDBQuery:UpdateDuplTimes(objPlayer:GetRoleID(), enteredTime + 1, dwDuplId)
			else
				self.objDBQuery:UpdateDuplTimesAndCreateTime(objPlayer:GetRoleID(), enteredTime + 1, dwDuplId)
			end;
		end;
		
		self.DuplEnterTimeInfo[dwDuplId] = enteredTime + 1
		objPlayer.SynEnterFbInfoMsg{DuplId = dwDuplId, Times = enteredTime + 1}
		self:SendCompleteDuplAward(dwDuplId, passMoney, gold, zhenqi, exps, jiangLiItem, randomAwardItem)
		return;
	end;
	if enteredTime >= enterTime and enteredTime < (enterTime + addTime) then
		local bFlag, itemEnum =  self:CheckItemNum(dwDuplId)
		if not bFlag then
			return;
		end;
		itemSystem:DelEnumItemInPacket(itemEnum, 1, false, _G.ItemSysOperType.CompleteDuplUsed);
		--扣钱扣道具发奖励加次数
		itemSystem:CostGold(costGold, _G.ItemSysOperType.CompleteDupl)
		if not self.DuplEnterTimeInfo[dwDuplId] then
			self.objDBQuery:AddDuplInfo(objPlayer:GetRoleID(), dwDuplId, 1)
		else
			if self.objCurDupl then
				self.objDBQuery:UpdateDuplTimes(objPlayer:GetRoleID(), enteredTime + 1, dwDuplId)
			else
				self.objDBQuery:UpdateDuplTimesAndCreateTime(objPlayer:GetRoleID(), enteredTime + 1, dwDuplId)
			end;
		end;

		self.DuplEnterTimeInfo[dwDuplId] = enteredTime + 1
		objPlayer.SynEnterFbInfoMsg{DuplId = dwDuplId, Times = enteredTime + 1}
		self:SendCompleteDuplAward(dwDuplId, passMoney, gold, zhenqi, exps, jiangLiItem, randomAwardItem)
		return;
	end;
	if enteredTime >= (enterTime + addTime) then
		--没有次数了
		return;
	end;
end;

--检测道具
function CDuplSystem:CheckItemNum(dwDuplId)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local dwCounts, _, _ = 0, 0, 0;
	local itemTbl = DuplConfig[dwDuplId].fbItemProp;
	for _, info in pairs(itemTbl) do
		if info.dwItemEnum ~= 5500080 then
			dwCounts, _, _ = itemSystem:GetEnumItemNumInPacket(info.dwItemEnum);
			if dwCounts > 0 then
				return true, info.dwItemEnum;
			end;
		end;
	end;
	dwCounts, _, _ = itemSystem:GetEnumItemNumInPacket(5500080);
	if dwCounts > 0 then
		return true, 5500080;
	end;
	return false, 0;
end;

--发放钱等副本奖励（一键完成）
function CDuplSystem:SendCompleteDuplAward(dwDuplId, money, gold, zhenqi, exps, jiangLiItem, randomAward)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local itemSystem = objPlayer:GetSystem("CItemSystem");
	local duplSystem = objPlayer:GetSystem("CDuplSystem");
	local objElemSystem = objPlayer:GetSystem("CFiveElemSystem");
	if not itemSystem then
		return;
	end;
	if not duplSystem then
		return;
	end;
	if money and money > 0 then
		itemSystem:AddPacketMoney(money, _G.ItemSysOperType.CompleteDuplAward);  --银两
	end;
	if gold and gold > 0 then
		itemSystem:AddBindGold(gold, _G.ItemSysOperType.CompleteDuplAward);   --礼金
	end;
	if zhenqi then
		if objElemSystem then
			local uItemGold, uItemWood, uItemWater, uItemFire, uItemEarth  = objElemSystem:GetElemValue()	
			--消耗真气
			objElemSystem:ChangeAttr("dwMetalValue",zhenqi)
			objElemSystem:ChangeAttr("dwWoodValue",zhenqi)
			objElemSystem:ChangeAttr("dwWaterValue",zhenqi)
			objElemSystem:ChangeAttr("dwFireValue",zhenqi)
			objElemSystem:ChangeAttr("dwEarthValue",zhenqi)
			local setData = {
				[1] = {dwCurrent = uItemGold, dwChange = zhenqi};
				[2] = {dwCurrent = uItemWood, dwChange = zhenqi};
				[3] = {dwCurrent = uItemWater, dwChange = zhenqi};
				[4] = {dwCurrent = uItemFire, dwChange = zhenqi};
				[5] = {dwCurrent = uItemEarth, dwChange = zhenqi};
			}
			CLogSystemManager:zhenqi(objPlayer, setData, _G.FiveElemSysOperType.CompleteDuplAward)
		end;
	end;
	if exps then
		objPlayer:AddExp(exps);
	end;

	local rate = DuplConfig[dwDuplId].CompleteRate;
	local awardItem = {};
	for _,v in ipairs(jiangLiItem) do
		local tItem = {
			dwItemEnum	= v.dwItemEnum;
			dwItemNumber= math.floor(rate * v.dwItemNumber);
			dwBindType	= v.dwBindType;
		};
		table.insert(awardItem,tItem);
	end;
	local bFlag = itemSystem:AddEnumItemListToPacket(awardItem or {}, _G.ItemSysOperType.CompleteDuplAward);
	if not bFlag then
		CDuplManager:SendAward(dwDuplId, objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName, 0, 0, awardItem);
	end;

	local bFlag = itemSystem:AddEnumItemListToPacket(randomAward or {}, _G.ItemSysOperType.CompleteDuplAward);
	if not bFlag then
		CDuplManager:SendAward(dwDuplId, objPlayer:GetRoleID(), objPlayer:GetInfo().szRoleName, 0, 0, randomAward);
	end;
	if objPlayer:GetSystem('CPlayerEventCenterSystem') and _G.EnterPassEvent[dwDuplId] then
		objPlayer:GetSystem('CPlayerEventCenterSystem'):DoEvent(_G.EnterPassEvent[dwDuplId]);
	end;
end;

---------------------------------------------------------------------------
---------------------------------------------------------------------------
---------------------------------------------------------------------------
--点击npc
function CDuplSystem:SetDuplLifeTime(dwDuplModel)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objCurDupl = self.objCurDupl;
	if not objCurDupl then
		return;
	end;
	self:TeamMateaRegFbSys(objCurDupl);
	
	local runTime = GetCurTime() - self.DuplLife;
	self.dwUpdateTime = runTime;
	self.StopRecTime = false;
	self.lastTime = GetCurTime();
	
	for _, system in pairs(objCurDupl.SystemTbl) do
		if system:IsInDupl() then
			runTime = GetCurTime() - system.DuplLife;
			local objMe = system:GetPlayer();
			local times = DuplConfig[objCurDupl.dwCfgID].dwCloseFbTime * 60 * 1000 - runTime;
			objMe.EnterDuplSetTimeMsg{Time = times, DuplModel = dwDuplModel};
			system:ResGetFbShowInfo(true);
		end;
	end;
	
end;

function CDuplSystem:RefreshToll(bContinue)
	local objPlayer = self:GetPlayer();
	if not objPlayer then
		return;
	end;
	local objDupl = self.objCurDupl;
	if not objDupl then
		return;
	end;
	local teamSystem = objPlayer:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	-- local captainId = teamSystem:GetCaptainId(); 
	-- if captainId ~= objPlayer:GetRoleID() then
		-- return;
	-- end;
	if bContinue then
		--获取队长
		local captainId = teamSystem:GetCaptainId();
		local captain = objPlayer;
		if captainId then
			if captainId ~= objPlayer:GetRoleID() then
				captain = objPlayer:GetOtherPlayer(captainId, 3);
			end
		end
		local duplSystem = captain:GetSystem("CDuplSystem");
		local duplAddition = DuplAddition[objDupl.dwCfgID];
		if duplAddition then
			local refreshId = duplSystem:GetTollGateNum();
			duplAddition:RefreshMonster(refreshId + 1, objPlayer, captain);
			duplSystem.StopRecTime = false;
		end;
		
		local teamMate = teamSystem:GetTeamLeaguer();
		local member = nil;
		if teamMate then
			for _, memberId in pairs(teamMate) do
				if objPlayer:GetRoleID() ~= memberId then
					member = objPlayer:GetOtherPlayer(memberId, 3);
				else
					member = objPlayer;
					--member.SendCangLongContinueMsg{};
				end;
				
				local mapSystem = member:GetSystem("CMapSystem");
				local _, mapCfgId = mapSystem:GetCurMapID();
				local _, duplMapId = DuplConfig[self.objCurDupl.dwCfgID].MapSet();
				
				if mapCfgId == duplMapId then
					member.SendCangLongContinueMsg{};
				end
			end
		end
	else
		--副本结束
		-- print("CDuplSystem:RefreshToll=============false==")
		self:WoHuCangLongLeave();
	end;
end;
