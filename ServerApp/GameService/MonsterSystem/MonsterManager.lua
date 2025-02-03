--[[
 服务器 Monster
 Monster 管理器
 周长沙
 2012-2-3
--]]
----------------------------------------
_G.CMonsterManager = {};
----------------------------------------
local function group_msg(setNet,szMsgName,tParam)
	_groupcallout(setNet, szMsgName, tParam);
end
------------本地函数
--表复制
local function CopyTable(T)
	local tbNew = {}
	for k,v in pairs(T) do
		if type(v)=="table" then
			tbNew[k] = CopyTable(v)
		else
			tbNew[k] = v
		end
	end
	return tbNew
end
--------------------------------
--构造
function CMonsterManager:new(Map)
	local obj = {}
	--保存地图对象
	obj.Map = Map
	for k,v in pairs(CMonsterManager) do
		if type(v)=="function" then
			obj[k]=v
		end
	end
	return obj;
end
--初始化
function CMonsterManager:Create(DiffTbl)
	--创建驱动
	self:CreateDriver()
	--Monster 节点
	self.Nodes = {}
	--当前可用对象id
	self.NowId = (self.Map.MapID or 1) * 10000
	--地图当前Monster数量
	self.NowMonsterNum = 0
	--记录
	self.CountMonster = {dwNormal=0;dwBatter=0;dwBoss=0;}
	--难度系数
	self.DiffTbl = DiffTbl or {}
	--初始化默认Monster信息
	self:InitDefaultMonsterInfo(self.Map)
	--更新延迟
	self.dwUpdateDelay = 200
	--上次更新时间
	self.dwLastUpdateTime = 0
	--刷新更新延迟
	self.dwBornDelay = 1000
	--上次刷新更新时间
	self.dwLastBornUpdateTime = 0
	--当前飙车数量
	self.dwNowEscortNum = 0
	
	--当前的个人镖车
	self.setRoleEscortList = {};
	return true
end
--更新 服务器的 Monster 逻辑
function CMonsterManager:Update(dwDelayTime)
	local NowTime = GetCurTime()
	if NowTime - self.dwLastBornUpdateTime >= self.dwBornDelay then
		self.dwLastBornUpdateTime = NowTime
		-- for ObjId,Node in pairs(self.Nodes) do
			-- Node:BornLogic(dwDelayTime,NowTime)
		-- end
		self:StartDriver()
	end
		--[[
		for ObjId,Node in pairs(self.Nodes) do
			Node:Update(dwDelayTime,NowTime)
		end
		--]]
		
	return true	
end
--销毁
function CMonsterManager:Destroy()
	for k,v in pairs(self.Nodes)do
		self:Remove(k);
	end
	self:StopDriver()
	return true
end
--怪物出生
function CMonsterManager:OnMonsterBorn(Monster)
	local dwType = Monster:GetMonsterType()
	if dwType== 0 then
		self.CountMonster.dwNormal = (self.CountMonster.dwNormal or 0) + 1
	elseif dwType== 1 then
		self.CountMonster.dwBatter = (self.CountMonster.dwBatter or 0) + 1
	elseif dwType== 2 then
		self.CountMonster.dwBoss = (self.CountMonster.dwBoss or 0) + 1
	end
	self:SendMonNum()
end
--怪物死亡
function CMonsterManager:OnMonsterDead(Monster)
	local dwType = Monster:GetMonsterType()
	if dwType== 0 then
		self.CountMonster.dwNormal = (self.CountMonster.dwNormal or 0) - 1
	elseif dwType== 1 then
		self.CountMonster.dwBatter = (self.CountMonster.dwBatter or 0) - 1
	elseif dwType== 2 then
		self.CountMonster.dwBoss = (self.CountMonster.dwBoss or 0) - 1
	end
	self:SendMonNum()
	self:RemoveOnDead(Monster:GetRoleID())
end
--怪物移除
function CMonsterManager:OnMonsterHide(Monster)
	local dwType = Monster:GetMonsterType()
	local sysAI = Monster:GetSystem("CMonsterAISystem")
	if sysAI:GetState() ~= MonsterState.Dead then
		if dwType== 0 then
			self.CountMonster.dwNormal = (self.CountMonster.dwNormal or 0) - 1
		elseif dwType== 1 then
			self.CountMonster.dwBatter = (self.CountMonster.dwBatter or 0) - 1
		elseif dwType== 2 then
			self.CountMonster.dwBoss = (self.CountMonster.dwBoss or 0) - 1
		end
		self:SendMonNum()
	end
end
-----------------------------------------------
--插入一个Monster信息到管理器
function CMonsterManager:Insert(Node)
	if not Node.ObjId or  Node.ObjId==0 then
		self.NowId = self.NowId + 1
		Node.ObjId = self.NowId
	end
	if self.Nodes[Node.ObjId] then
		self.Nodes[Node.ObjId]:Remove()
	end
	self.Nodes[Node.ObjId]=Node
	Node.tbFun = CScriptManager:GetScript(ScriptTypeConfig.Monster,Node:GetID()) or {}
	--Node.DiffTbl = self.DiffTbl or {}
	local Map = Node.Map
	local tPos = Node.SYS["CMonsterMoveSystem"]:GetVPos()
	local dwX,dwY = tPos.x,tPos.y
	
	Node.dwLogicID = _CreateMapNode(1,Node.ObjId,0);
	
	-- local dwCheckerX,dwCheckerY = CCheckerManager:GetCurChecker(Map,dwX,dwY)
	-- Node.SYS["CMonsterMoveSystem"]:SetChecker(dwCheckerX,dwCheckerY)
	-- Map.setChecker[dwCheckerX][dwCheckerY]:AddMonster(Node);
	-- CCheckerManager:InitCanSeeEntity(Map,Node.SYS["CMonsterMoveSystem"].setCanSeeEntity,dwCheckerX,dwCheckerY)
	Node:CheckShow()
	self.NowMonsterNum = self.NowMonsterNum + 1
	return Node.ObjId
end
--新增一个Monster
function CMonsterManager:Add(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,bNoShow,dwObjId,objPlayer,dwGuildID)
	local Map = self.Map
	local Node = CMonster:new(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,Map,bNoShow,self.DiffTbl,objPlayer,dwGuildID)
	if not Node then
		_err("config err dwMonsterId:"..tostring(dwMonsterId).." dwFightId:"..tostring(dwFightId).." dwAIId"..tostring(dwAIId))
		return;
	end
	if dwObjId then
		Node.ObjId = dwObjId
	end
	local dwObjId = self:Insert(Node)
	return dwObjId
end
--移除一个Monster
function CMonsterManager:Remove(dwObjId)
	if self.Nodes[dwObjId] then
		local objMonster = self.Nodes[dwObjId]
		-- local dwCheckerX,dwCheckerY = objMonster.SYS["CMonsterMoveSystem"]:GetChecker()
		-- objMonster.Map.setChecker[dwCheckerX][dwCheckerY]:DelMonster(objMonster);
		self.Nodes[dwObjId]:Remove()
		self.Nodes[dwObjId] = nil
		self.NowMonsterNum = self.NowMonsterNum - 1
	else
		print("Remove a nil mon")
	end
end
--延迟X毫秒新增一个Monster
function CMonsterManager:DelayAdd(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwObjId,dwDelay,objPlayer)
	self.NowId = self.NowId + 1
	local dwDelay = dwDelay or 0
	local Map = self.Map
	local dwObjId = dwObjId or self.NowId
	local f = function()
		self:Add(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,false,dwObjId,objPlayer)
	end
	-- local Param = {}
	-- CTimer:AddTimer( dwDelay, false, f, Param )
	
	self.Map:AddTimeEvent(dwDelay,f)
	
	return dwObjId
end
--延迟X毫秒移除一个Monster
function CMonsterManager:DelayRemove(dwObjId,dwDelay)
	local f = function()
		self:Remove(dwObjId)
	end
	--local Param = {}
	local dwDelay = dwDelay or 0
	--CTimer:AddTimer( dwDelay, false, f, Param )
	
	self.Map:AddTimeEvent(dwDelay,f)
end
--延迟X毫秒新增X个Monster
function CMonsterManager:DelayAddEx(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,dwRound,dwNum,dwDelay,objPlayer)
	local dwDelay = dwDelay or 0
	local objs = {}
	local f = function()
		for i=1,dwNum do
			local dwX = dwX + math.random(-dwRound,dwRound)
			local dwY = dwY + math.random(-dwRound,dwRound)
			local dwObjId = self:Add(dwMonsterId,dwFightId,dwAIId,dwDropId,dwLookId,dwX,dwY,false,dwObjId,objPlayer)
			table.insert(objs,dwObjId)
		end
	end
	--local Param = {}
	--CTimer:AddTimer( dwDelay, false, f, Param )
	self.Map:AddTimeEvent(dwDelay,f)
	return objs
end

--设置地图的定时器 （可停止或者继续定时刷怪）
function CMonsterManager:SetTimerUpdate(bNeedUpdate)
	self.Map:SetTimerUpdate(bNeedUpdate);
end
--------------------------------------------------------------------
--显示一个Monster
function CMonsterManager:Show(dwObjId)
	local ObjId = dwObjId
	if self.Nodes[ObjId] then
		self.Nodes[ObjId]:Show()
	else
		print("Show a nil npc")
	end
end
--隐藏一个Monster
function CMonsterManager:Hide(dwObjId)
	local ObjId = dwObjId
	if self.Nodes[ObjId] then
		self.Nodes[ObjId]:Hide()
	else
		print("Hide a nil npc")
	end
end
--修改一个Monster
function CMonsterManager:Modi(dwObjId,tbInfo)
	local ObjId = dwObjId
	if self.Nodes[ObjId] then
		self.Nodes[ObjId]:Modi(tbInfo)
	else
		print("Modi a nil npc")
	end
end
--Monster播放动作
function CMonsterManager:Play(dwObjId,dwActionId)
	local ObjId = dwObjId
	if self.Nodes[ObjId] then
		self.Nodes[ObjId]:Play(dwActionId)
	else
		print("Play a nil npc")
	end
end
--发送怪物数量信息
function CMonsterManager:SendMonNum(objPlayer)
	if self.Map.dwMapType == 0 then return end;
	local Normal,Batter,Boss = 0,0,0
	for k,v in pairs(self.Nodes) do
		if v:IsNeedSend() then
			if v.DataInfo._type == 0 then
				Normal = Normal + 1
			elseif v.DataInfo._type == 1 then
				Batter = Batter + 1
			elseif v.DataInfo._type == 2 then
				Boss = Boss + 1
			end
		end
	end
	self.CountMonster.dwNormal = Normal
	self.CountMonster.dwBatter = Batter
	self.CountMonster.dwBoss = Boss

	if objPlayer then
		objPlayer.MonsterSynchroMsg{Normal=self.CountMonster.dwNormal;Batter=self.CountMonster.dwBatter;Boss=self.CountMonster.dwBoss;}
	else
		local setNet = {}
		local szMsgName = "MonsterSynchroMsg"
		local tParam = {Normal=self.CountMonster.dwNormal;Batter=self.CountMonster.dwBatter;Boss=self.CountMonster.dwBoss;}
	
		local Players = self.Map:GetAllPlayer()
		for k,v in pairs(Players) do
			table.insert(setNet,v.objNet)
			--v.MonsterSynchroMsg{Normal=self.CountMonster.dwNormal;Batter=self.CountMonster.dwBatter;Boss=self.CountMonster.dwBoss;}
		end
		group_msg(setNet,szMsgName,tParam)
	end
end
--获得怪物数量信息
function CMonsterManager:GetMonNum()
	return self.CountMonster
end
---------------------------------------------------------------------
--服务器开启时，初始化所有默认Monster信息
function CMonsterManager:InitDefaultMonsterInfo(Map)
	local mapID = Map.MapID
	
		-- if mapID~=1001 then
			-- return
		-- end
	
	if _G.MapInfoConfig[mapID] and type(_G.MapInfoConfig[mapID].monster)=="table" then
		for ID,Info in pairs(_G.MapInfoConfig[mapID].monster) do
			for i=1,Info.num do
				local dwX = Info.x + math.random(-Info.round,Info.round)
				local dwY = Info.y + math.random(-Info.round,Info.round)
				local cfgMap = MapInfoConfig[mapID];
				if not Map:CanMoveTo(_Vector2.new(cfgMap.fReviseX or 0,cfgMap.fReviseY or 0),_Vector2.new(dwX,dwY)) then
					dwX = Info.x + math.random(-100,100)/100
					dwY = Info.y + math.random(-100,100)/100
				end
				if Info.round==0 then
					dwX = Info.x
					dwY = Info.y
				end
				--for i=1,10 do
					self:Add(Info.mon_id,Info.fight_id,Info.ai_id,Info.drop_id,Info.look_id,dwX,dwY,Info.unborn)
				--end
				
			end
			--print(ID)
		end
	end
	print("MON start END",mapID,self.NowMonsterNum)
end
---------------------------------------------------------------------
--获取地图中当前Monster数量
function CMonsterManager:GetAllMonsterNum()
	return self.NowMonsterNum
end
--获取地图的所有Monster信息
function CMonsterManager:GetMapMonsterInfo()
	local tbInfo = {}
	if self.Nodes then
		for ObjId,Mon in pairs(self.Nodes) do
			if Mon:IsNeedSend() then
				tbInfo[ObjId] = Mon:GetSendInfo()
			end
		end
	end
	return tbInfo
end
-----------------------------------------------------------------------
--获取单个Monster
function CMonsterManager:GetMonsterInfo(dwObjId)
	return self.Nodes[dwObjId]
end
--获取某个点某个范围内的怪物
function CMonsterManager:GetMonsterObjIdByPosNRange(dwRange,vPos)
	local tbInfo = {}
	local vPos = vPos or {x=0;y=0;}
	for dwObjId,Mon in pairs(self.Nodes) do
		local vMonPos = Mon:GetVectorPos()
		if math.sqrt((vMonPos.x - vPos.x)^2 + (vMonPos.y - vPos.y)^2) <= dwRange then
			tbInfo[dwObjId] = Mon
		end
	end
	return tbInfo
end
--根据MonsterId获得一个Monster
function CMonsterManager:GetMonsterInfoById(dwMonsterId)
	for dwObjId,Mon in pairs(self.Nodes) do
		if Mon:GetID() == dwMonsterId then
			return Mon
		end
	end
end
--根据Monsterid获得所有活着的Monster
--isNeedDead：是否需要死亡的怪物，true——是
function CMonsterManager:GetMonsterById(dwMonsterId,isNeedDead)
	local Monster = {}
	for dwObjId,Mon in pairs(self.Nodes) do
		if Mon:GetID() == dwMonsterId then
			if isNeedDead then
				table.insert(Monster,Mon)
			else
				if not Mon:IsDead() then
					table.insert(Monster,Mon)
				end
			end
		end
	end
	return Monster;
end
----------------------------------------------------------------------------------
--添加公会镖车
function CMonsterManager:AddGuildMonster(dwGuildID,dwLevel,dwHp,LineInfo,dwRoleID,EscortPlayer,MatchPlayer,szGuildName,dwBornTime)
	local cfg = GuildEscortConfig.Car[dwLevel or 1]
	local cfgMon = cfg.Monster
	local Pos = LineInfo[1].start
	local Mon = CMonster:new(cfgMon.dwMonsterId,cfgMon.dwFightId,cfgMon.dwAIId,cfgMon.dwDropId,cfgMon.dwLook_MN,Pos.x,Pos.y,self.Map,bNoShow,self.DiffTbl,objPlayer,dwGuildID)
	Mon.ObjId = 50000+dwGuildID
	local sysAI = Mon:GetSystem("CMonsterAISystem")
	self:Insert(Mon)
	sysAI:ChangeState(MonsterState.GuildEscort,LineInfo,dwLevel,dwRoleID,EscortPlayer,MatchPlayer,szGuildName,dwBornTime)
	self.dwNowEscortNum = self.dwNowEscortNum + 1
end
--移除公会镖车
function CMonsterManager:DelGuildMonster(dwGuildID)
	local dwObjId = 50000+dwGuildID
	self:Remove(dwObjId)
	self.dwNowEscortNum = self.dwNowEscortNum - 1
	self:RemoveEscortNode(dwObjId)
end

----------------------------------------------------------------------------------
--出镖车的接口
function CMonsterManager:BournRoleMonster(dwRoleID,szRoleName,dwLevel,dwQuality,LineInfo,dwBornTime)
	local cfg = PersonalEscortConfig.Car[dwLevel or 1][dwQuality];
	local cfgMon = cfg.Monster
	local Pos = LineInfo[1].start
	local objMon = CMonster:new(
		cfgMon.dwMonsterId,
		cfgMon.dwFightId,
		cfgMon.dwAIId,
		cfgMon.dwDropId,
		cfgMon.dwLook_MN,
		Pos.x,
		Pos.y,
		self.Map,
		nil,
		self.DiffTbl)
	objMon:SetOwner(MonsterOwnerType.RoleSingle,dwRoleID)
	self:Insert(objMon)
	
	local tbBornInfo = {};
	tbBornInfo.LineInfo = LineInfo;
	tbBornInfo.dwBornRoleID = dwRoleID;
	tbBornInfo.szBornName = szRoleName;
	tbBornInfo.dwBornTime = dwBornTime;
	tbBornInfo.dwLevel = dwLevel;
	tbBornInfo.dwQuality = dwQuality;
	
	local sysAI = objMon:GetSystem("CMonsterAISystem")
	sysAI:ChangeState(MonsterState.RoleEscort,tbBornInfo,nil,nil);
	
	self.dwNowEscortNum = self.dwNowEscortNum + 1
	
	objMon.isNotHurt = true;
	
	self.setRoleEscortList[objMon:GetRoleID()] = dwRoleID;
	
	return objMon;
end;

--抢镖车
function CMonsterManager:DacoityRoleMonster(dwMonsterID,dwCurRoleID,szRoleName)
	local objMonster = self:GetMonsterInfo(dwMonsterID);
	if not objMonster then
		return;
	end
	
	objMonster:SetOwner(MonsterOwnerType.RoleSingle,dwCurRoleID);
	
	local sysAI = objMonster:GetSystem("CMonsterAISystem");
	local tbBornInfo = sysAI:GetEscornInfo()
	sysAI:ChangeState(MonsterState.RoleEscort,tbBornInfo,dwCurRoleID,szRoleName);
	
	--广播
	_mapcallout("MonsterChangeOwnerMsg", 
	{
		ObjID = objMonster:GetRoleID();
		OwnerType = MonsterState.RoleEscort;
		OwnerID = dwCurRoleID;
	}, 
	objMonster.dwLogicID, true);
	
	_mapcallout("MonsterChangeNameMsg", 
	{
		ObjID = objMonster:GetRoleID();
		NewName = objMonster:GetName();
	}, 
	objMonster.dwLogicID, true);
end;

--删除镖车
function CMonsterManager:DelRoleMonster(dwMonsterID)
	self.setRoleEscortList[dwMonsterID] = nil;
	
	self:Remove(dwMonsterID)
	self.dwNowEscortNum = self.dwNowEscortNum - 1
	self:RemoveEscortNode(dwMonsterID)
end;

--通知所有镖车，发送失败结果
function CMonsterManager:SendAllRoleEscortFail()
	for dwMonsterID,dwRoleID in pairs(self.setRoleEscortList)do
		local objMonster = self:GetMonsterInfo(dwMonsterID);
		if objMonster then
			local AISystem = objMonster:GetSystem("CMonsterAISystem");
			if AISystem then
				local objState = AISystem:GetStateNode(MonsterState.RoleEscort);
				if objState then
					objState:SendRes(1);
				end
			end
		end
	end
end;

