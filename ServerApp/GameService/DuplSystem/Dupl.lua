--[[
功能：游戏副本,副本会使用线路管理起来管理，基层于游戏线
作者：周华杰
时间：2012-03-05
]]
_G.CDupl = {}
CMemoryDebug:Show("ObjDupl");
--dwDuplID:-->dwRoleId
--dwCfgID:-->dwDuplId(配置id)
function CDupl:new(dwDuplID,dwCfgID,dwCount,entityId, duplDiffTbl, dwLevel, duplType)
	local obj = {}
	obj.dwCfgID = dwCfgID;--记录副本配置ID
	obj.entityId = entityId;
	obj.dwBuilderId = dwDuplID;	
	obj.dwLineID = dwDuplID;
	obj.dwMaxPlayerCount = math.floor(dwCount or 12);
	obj.dwCurPlayerCount = 0;
	obj.duplDiffTbl = duplDiffTbl;
	obj.dwLevel = dwLevel;
	obj.setPlayer = {};
	
	obj.CanDelFlag = false;
	obj.CountDownFlag = false;
	obj.m_WinFlag = false;
	obj.SystemTbl = {};
	obj.EnterPlayerTbl = {};
	obj.Count = {};   --怪物信息
	obj.Exp = {};     --经验信息
	obj.dwDuplType = duplType; --0为单人本,其他为多人本 
	obj.MonsterTime = 1;
	obj.BossTbl = {};
	obj.BossTbl["boss"] = 0;
	obj.createAlockIndex = 0;
	obj.tsAlockIndex = 0;
	obj.delAlockIndex = 0;
	obj.RefedMonsterTbl = {};
	obj.FailedTbl = {};
	obj.DuplState = true;  --默认副本为胜利状态
	obj.DeadNum = 0;
	obj.awardType = 1;
	
	--副本关数
	obj.TollGateNum = 0;
	obj.TollWin = false;   --通关副本默认为失败状态
	obj.forbiddenReliveNow = false;	--是否禁用原地复活
	obj.bIsDaLuanDou = false;
	
	for i,v in pairs(CDupl) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	CMemoryDebug:AddObject("ObjDupl", obj);
	return obj;
end; 

function CDupl:Create(setMapID)
	local setMapID = setMapID or GameLineConfig.setMapConfig;
	if not CMapManager:CreateDupl(setMapID, self) then
		return false;
	end; 
	return true;
end;

function CDupl:Update(dwInterval)
	-- if CMapManager then
		-- CMapManager:Update();
	-- end;
end;

function CDupl:Destroy()
	-- if CMapManager then
		-- CMapManager:Destroy();
	-- end;
end;

--设置通关关卡
function CDupl:SetTollGateNum(dwTollNum)
	self.TollGateNum = dwTollNum;
end;
function CDupl:GetTollGateNum()
	return self.TollGateNum;
end;

function CDupl:SetTollWin(bFlag)
	self.TollWin = bFlag;
end;
function CDupl:GetTollWin()
	return self.TollWin;
end;


function CDupl:GetDuplType()
	return self.dwDuplType;
end;

function CDupl:PlayerEnter(objPlayer)
	if self.setPlayer[objPlayer:GetRoleID()] then
		return false;
	end;
	self.dwCurPlayerCount = self.dwCurPlayerCount +1;
	self.setPlayer[objPlayer:GetRoleID()] = objPlayer;
	return true;
end;

function CDupl:PlayerExit(dwRoleID)
	self.dwCurPlayerCount = self.dwCurPlayerCount - 1;
	self.setPlayer[dwRoleID] = nil;
end;

function CDupl:GetPlayer(dwRoleID)
	if not dwRoleID or dwRoleID == 0 then
		return self.setPlayer;
	end;
	return self.setPlayer[dwRoleID];
end;

function CDupl:GetID()
	return self.dwLineID;
end;

function CDupl:GetMaxCount()
	return self.dwMaxPlayerCount;
end;

function CDupl:GetCurCount()
	return self.dwCurPlayerCount;
end;

function CDupl:GetMapManager()
	return CMapManager;
end;

function CDupl:GetLevel()
	return self.dwLevel;
end;

--获取地图
function CDupl:GetMap(dwMapID)
	if not self.objMapMgr then
		return nil;
	end;
	return CMapManager:GetMap(dwMapID );
end;

--获取副本配置
function CDupl:GetDuplConfig()
	return DuplConfig[self:GetID()];
end;
--设置副本奖励个数(金箱子)
function CDupl:SetDuplAwardNum(num)
	self.AwardNum = num;
end;
--设置副本银宝箱个数
function CDupl:SetSilverNum(num)
	self.SilverNum = num;
end;
--设置副本木宝箱个数
function CDupl:SetCopperNum(num)
	self.CopperNum = num;
end;
function CDupl:GetDuplAwardNum()
	return self.AwardNum;
end;
function CDupl:GetSilverNum()
	return self.AwardNum;
end;
function CDupl:GetCopperNum()
	return self.AwardNum;
end;
--获得奖励列表
function CDupl:GetDuplAwardList()
	return self.AwardList;
end;
--设置奖励类型
function CDupl:SetAwardType(types)
	self.awardType = types;
end;
--获得奖励类型
function CDupl:GetAwardType()
	return self.awardType;
end;
--设置副本奖励及评分
function CDupl:SetDuplAward(lifeTime)
	self.AwardList = {} 
	local recordInfo = CDuplManager:GetDuplRecord();
	if recordInfo[self.dwCfgID][2] == 0 or lifeTime <= recordInfo[self.dwCfgID][2] then
		self:SetAwardType(1)
	else
		local deadTime = self:GetDeadNum();
		if deadTime <= _G.DuplDeadGrade[1] then   --奖励类型2
			self:SetAwardType(2)
		elseif deadTime > _G.DuplDeadGrade[1] and deadTime <= _G.DuplDeadGrade[2] then
			self:SetAwardType(3)
		elseif deadTime > _G.DuplDeadGrade[2] then
			self:SetAwardType(4)
		end;
	end;
	local awardList = _G.DuplAwardGroup[self:GetAwardType()];
	local copyTbl = {};
	for i = 1, 5 do
		table.insert(copyTbl, i);
	end;
	local recordTbl = {};
	for types, info in pairs(awardList) do
		if info > 0 then
			for i = 1, info do
				local seed = math.random(1, #(copyTbl));
				local chooseNum = copyTbl[seed]; 
				recordTbl[chooseNum] = _G.AwardTypeTbl[types];
				table.remove(copyTbl, seed);
			end;	
		end;
	end;
	self.AwardList = recordTbl;
end;
--进入获胜奖励流程
function CDupl:SendWinAward()
	local lifeTime = GetCurTime() - self.LifeTime;
	if self.NowTime then
		lifeTime = GetCurTime() - self.LifeTime - (GetCurTime() - self.NowTime);
	end;
	self:SetDuplAward(lifeTime);
	--单人本
	local num = 0;
	if self.SystemTbl then
		num = #(self.SystemTbl);
	end; 
	if self.m_WinFlag and self:GetDuplDefState() then
		if self:GetDuplType() == 0 and (not _G.ChallengeQunXiaConfig.IsQunXiaFB(self.dwCfgID)) then	
			if lifeTime >= 60000 then
				CDuplManager:UpdateRecordInfo(self.dwCfgID, self.EnterPlayerTbl[1][1], lifeTime, self.EnterPlayerTbl[1][2], self.EnterPlayerTbl[1][3])
			else
				_info("----SendWinAward too quick----", self.dwCfgID, self.EnterPlayerTbl[1][1], lifeTime, self.LifeTime);
			end;
		end;
		for _, duplSystem in pairs(self.SystemTbl) do
			if duplSystem then
				duplSystem:SetZLBoss();
				duplSystem:SendWinAward(self.dwCfgID, lifeTime, num, self.EnterPlayerTbl, self:GetLevel(), self:GetDuplAwardList(), self.LifeTime, self:GetAwardType());
				break;
			end;
		end;
	end;
end;
--进入删除流程
function CDupl:EnterDelState()
	local lifeTime = GetCurTime() - self.LifeTime;
	if self.NowTime then
		lifeTime = GetCurTime() - self.LifeTime - (GetCurTime() - self.NowTime);
	end;
	self:SetDuplAward(lifeTime);
	--单人本
	local num = 0;
	if self.SystemTbl then
		num = #(self.SystemTbl);
	end; 
	if self.m_WinFlag and self:GetDuplDefState() then
		-- if self:GetDuplType() == 0 then
			-- CDuplManager:UpdateRecordInfo(self.dwCfgID, self.EnterPlayerTbl[1][1], lifeTime, self.EnterPlayerTbl[1][2], self.EnterPlayerTbl[1][3])
		-- end;
		-- for _, duplSystem in pairs(self.SystemTbl) do
			-- if duplSystem then
				-- duplSystem:SetZLBoss();
				-- duplSystem:SendWinAward(self.dwCfgID, lifeTime, num, self.EnterPlayerTbl, self:GetLevel(), self:GetDuplAwardList());
				-- break;
			-- end;
		-- end;
	else
		if self.SystemTbl[1] then
			self.SystemTbl[1]:SetZLBoss();
			self.SystemTbl[1]:SendFailedAward(self.EnterPlayerTbl, self.dwCfgID, lifeTime, num, self.LifeTime);
		else
			for _, info in pairs(self.EnterPlayerTbl) do 
				CLogSystemManager:transcript(nil,math.floor(self.LifeTime /1000), lifeTime, num, self.dwCfgID);
			end;
		end;
	end;
	self.EnterPlayerTbl = {};
	for _, system in pairs(self.SystemTbl) do
		system.DuplInfo = {};
	end;
	self.SystemTbl = {};
	self:DestroyDuplMap();
	CDuplManager:DelDupl(self);
	CGutDuplManager:DelGutDupl(self);
end;

function CDupl:DestroyDuplMap()
	if self.maps  then
		for _, map in pairs(self.maps) do
			if map then
				map:Destroy();
				CMapManager:DestroyMap(map.DuplMapID)
				map = nil;
			end;
		end;
	end;
	self.maps = nil;
	self.map = nil;
end;

--获得副本的entityId
function CDupl:GetFbEntityId()
	return self.entityId;
end;
--删除副本内的系统
function CDupl:DeleteDuplSystem(duplSystem)
	for i, system in pairs(self.SystemTbl) do
		if system == duplSystem then
			table.remove(self.SystemTbl, i);
		end;
	end;
end;
--删除副本对应的所有的系统
function CDupl:DelAllSystem()
	for i, system in pairs(self.SystemTbl) do
		system.objCurDupl = nil;
		system.DuplInfo = {};
	end;
	self.SystemTbl = {};
end;

--离开副本时间到删除副本
function CDupl:DelFb()
	self.CanDelFlag = true;
	if self:GetCurCount() <= 0 then
		for i, system in pairs(self.SystemTbl) do
			if system then
				--system:DuplAlarmDel();
				system:SynDuplWndInfo();
				system.objCurDupl = nil;
				system.DuplInfo = {};
				system.ExitDuplId = 0; 
				system.EnterFbFlag = false;
			end;
		end;
		self:EnterDelState();
		self:DelAllAlock();
	end;	
end;
function CDupl:DelAllAlock()
	self:DelCreateDuplAlock();
	self:DelTsDuplAlock();
	self:DelAlock();
end;
function CDupl:DelCreateDuplAlock()
	if self:GetDuplCreateAlock() ~= 0 then
		_G.CAlarmClock:DelTask(self:GetDuplCreateAlock());
		self.createAlockIndex = 0;
	end;
end;
function CDupl:DelTsDuplAlock()
	if self:GetDuplTsAlock() ~= 0 then
		_G.CAlarmClock:DelTask(self:GetDuplTsAlock());
		self.tsAlockIndex = 0;
	end;
end;
function CDupl:DelAlock()
	if self:GetDuplDelAlock() ~= 0 then
		_G.CAlarmClock:DelTask(self:GetDuplDelAlock());
		self:SetDuplDelAlock(0);
	end;
end;
--副本时间到删除副本
function CDupl:DelFbWhenOver()	
	self.CanDelFlag = true;
	for i, system in pairs(self.SystemTbl) do
		if system then
			--_err("--------DuplTest11-------server", self.dwCfgID);	
			_info("--------DuplTest11-------server", self.dwCfgID);	
			system:DeleteFbOper(self.dwCfgID);
		end;
	end;
end;
--剧情本删除
function CDupl:DeleteGutDupl()
	--[[
	local gutDuplPlayer = CGutDuplManager:GetPlayer();
	for _, player in pairs(gutDuplPlayer) do
		if player then
			if player:GetSystem("CDuplSystem") then
				player:GetSystem("CDuplSystem"):Back();
			end;
		end;
	end;
	--]]
end;
function CDupl:CountDownGutDupl()
	if self.setPlayer then
		self.CountDownFlag = true;
		local flag  = false;
		for dwId, player in pairs(self.setPlayer) do
			flag  = true;
			local teamSystem = player:GetSystem("CTeamSystem");
			if teamSystem then
				teamSystem:NoticeClientLeaveFb(false, self.dwCfgID);
				self.NowTime = GetCurTime();
			end;
		end;
	end;
end;
--出场倒计时
function CDupl:ShowCountDown()
	for i, system in pairs(self.SystemTbl) do
		system.EnterFbFlag = true;
	end;
	if self.setPlayer then
		self.CountDownFlag = true;
		local flag  = false;
		for dwId, player in pairs(self.setPlayer) do
			flag  = true;
			local teamSystem = player:GetSystem("CTeamSystem");
			if teamSystem then
				teamSystem:NoticeClientLeaveFb(false, self.dwCfgID);
				self.NowTime = GetCurTime();
			end;
		end;
	end;
end;

function CDupl:GetPlayerInDupl()
	return self.setPlayer
end;
--判断副本内是否有人
function CDupl:HavePlayerInDupl()
	for dwId, _ in pairs(self.setPlayer) do
		return true;
	end;
	return false;
end;

--副本内杀怪信息
function CDupl:SetDuplMonsterInfo(dwType, num, monsterId)
	if DuplConfig[self.dwCfgID].bInShow ~= 0 then
		local monsterTimes = self:GetMonsterTimes();
		local monsterType = nil;
		if DuplMonsterType[self.dwCfgID][monsterTimes] then
			monsterType = DuplMonsterType[self.dwCfgID][monsterTimes][monsterId];
		end;
		if monsterType then
			if not self.monsterTbl then
				self.monsterTbl = {};
				self.monsterTbl[monsterType] = 0;
			end;
			if not self.monsterTbl[monsterType] then
				self.monsterTbl[monsterType] = 0;
			end;
			self.monsterTbl[monsterType] = self.monsterTbl[monsterType] + 1;
		end;
		if DuplMonsterType[self.dwCfgID]["boss"] then
			if DuplMonsterType[self.dwCfgID]["boss"][monsterId] then
				self.BossTbl["boss"] = self.BossTbl["boss"] + num;
			end;
		end;
	end;
end;

--获得怪物信息
function CDupl:GetDuplMonsterInfo()
	return self.monsterTbl, self.BossTbl;
end;

--获得副本的所有的打怪信息
function CDupl:GetAllMonsterInfo()
	return self.Count;
end;

--副本内经验信息
function CDupl:SetDuplExpInfo(roleId, num)
	if not self.Exp[roleId] then
		self.Exp[roleId] = num;
	else
		self.Exp[roleId] = self.Exp[roleId] + num;
	end;
end;

--获得经验信息
function CDupl:GetDuplExpInfo(roleId)
	return self.Exp[roleId];
end;

--设置副本开始时间lifeTime
function CDupl:SetLifeTime()
	self.LifeTime = GetCurTime();
end;

--获得副本时间LifeTime
function CDupl:GetLifeTime()
	return self.LifeTime;
end;
--玩家在单人本下线时间
function CDupl:SetLeaveTime()
	self.LeaveDuplTime = GetCurTime();
end;
function CDupl:GetLeaveTime()
	return self.LeaveDuplTime;
end;

--设置刷怪次数
function CDupl:SetMonsterTime(times)
	if DuplConfig[self.dwCfgID].bInShow ~= 0 then
		self.MonsterTime = times;
		--设置副本中怪物的信息
		local duplId = self.dwCfgID;
		local monsterInfo = DuplShowInfo[duplId][times]["monster"];
		local num = 0;
		self.monsterTbl = {};
		if monsterInfo then
			for index, info in pairs(monsterInfo) do
				if type(index) == "number" then
					if not self.monsterTbl[index] then
						self.monsterTbl[index] = 0;
					end;
				end;
			end;
		end;
		self.BossTbl["boss"] = 0;
		for dwId, player in pairs(self.setPlayer) do
			if player then
				player.SynMonsterTimesMsg{Times = times};
			end;
		end;
	end;
end;

--怪物死亡时设置时间等信息
function CDupl:SetInfoByDead(bossId)
	for dwId, player in pairs(self.setPlayer) do
		if player then
			local duplSystem = player:GetSystem("CDuplSystem");
			if duplSystem then
				duplSystem:SetBossDeadTime(bossId);
			end;
		end;
	end;
end;
--读取副本内刷怪次数
function CDupl:GetMonsterTimes()
	return self.MonsterTime;
end;
--设置副本create定时器
function CDupl:SetDuplCreateAlock(index)
	self.createAlockIndex = index;
end;
function CDupl:GetDuplCreateAlock()
	return self.createAlockIndex;
end;
--设置副本提示定时器
function CDupl:SetDuplTsAlock(index)
	self.tsAlockIndex = index;
end;
function CDupl:GetDuplTsAlock()
	return self.tsAlockIndex;
end;
--设置离开副本后删除副本定时器
function CDupl:SetDuplDelAlock(index)
	self.delAlockIndex = index;
end;
function CDupl:GetDuplDelAlock()
	return self.delAlockIndex;
end;

--玩家是否进入过次副本
function CDupl:GetIsEntered(dwRoleId)
	for i, info in pairs(self.EnterPlayerTbl) do
		if info then
			if info[1] == dwRoleId then
				return true;
			end;
		end;
	end;
	return false;
end;
--记录已刷过的怪物
function CDupl:SetRefedMonster(waveId)
	self.RefedMonster = true;
	self:SetMonsterTime(waveId);
end;
--获得已刷过的怪物
function CDupl:GetRefedMonster()
	return self.RefedMonster;
end;

--记录已击败的怪物
function CDupl:SetFailedMonster(bossId)
	self.FailedTbl[bossId] = true;
	self.RefedMonster = false;
end;

--获得记录已击败的怪物
function CDupl:GetFailedMonster()
	return self.FailedTbl;
end;
--设置当前怪物的刷新时间
function CDupl:SetCurWaveBegin()
	self.refreshTime = GetCurTime();
end;
--获得当前怪物的刷新时间
function CDupl:GetCurWaveBegin()
	return self.refreshTime;
end;

--设置副本默认状态
function CDupl:SetDuplDefState(bState)
	self.DuplState = bState;
	for _, player in pairs(self.setPlayer) do
		if player then
			player.NoticeDuplFailedMsg{};
		end;
	end;
end;
--获得副本默认状态
function CDupl:GetDuplDefState()
	return self.DuplState;
end;
--设置副本内死亡次数
function CDupl:SetDeadNum()
	self.DeadNum = self.DeadNum + 1; 
end;
--获得副本内死亡次数
function CDupl:GetDeadNum()
	return self.DeadNum;
end;