--[[
功能： Monster 系统类（服务器）
作者：周长沙
时间：2012-2-3
--]]
-------------------------------------
_G.CMonsterSystem = {}
-------------------------------------
-------------------------------------
function CMonsterSystem:new()
	local obj = CSystem:new("CMonsterSystem");
	for i,v in pairs(CMonsterSystem) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	obj.CanSeeMonster = {}
	obj.AddList = {}
	obj.DelList = {}

	return obj;
end
function CMonsterSystem:Create()
	self.CanSeeMonster = {}
	self.AddList = {}
	self.DelList = {}
	self.dwDelay = MapInfoConfig.dwTimeMon
	self.dwCount = MapInfoConfig.dwCountMon
	self.dwLastTime = 0
	self.Node = nil
	return true;
end
function CMonsterSystem:Update(dwInterval)
	if not self.Node then return end;
	local Add = {} 
	local Del = {}
	local bNeedSend = false
	local dwCount = 0
	
	for k,v in pairs(self.DelList) do
		Del[k]=v
		self.DelList[k]=nil
		bNeedSend=true
		--break
	end
		
	for k,v in pairs(self.AddList) do
		local Monster = v
		if Monster and Monster:IsNeedSend() then
			Add[Monster:GetRoleID()] = Monster:GetSendInfo()
			bNeedSend = true
			dwCount = dwCount + 1
		end
		self.AddList[k]=nil
		if dwCount == self.dwCount then
			break
		end
	end
	if bNeedSend then
		local objPlayer = self:GetPlayer()
		objPlayer.MonsterGetMapAllMonsterMsg{Add=Add;Del=Del}
	else
		CDriverManager:DelDriver(self.Node)
		self.Node = nil
	end
	return true
end
function CMonsterSystem:Destroy()
	if self.Node then
		CDriverManager:DelDriver(self.Node)
	end
	self.dwLastTime = nil;
	return true
end
function CMonsterSystem:Clear()
	self.CanSeeMonster = {}
	self.DelList = {}
	self.AddList = {}
end
---------------------------------------------------
--消息接收
---------------------------------------------------
--收到左键点击 Monster 消息
function CMonsterSystem:OnLClick(dwObjId,dwMapId)
end
--收到右键点击 Monster 消息
function CMonsterSystem:OnRClick(dwObjId,dwMapId)
end
--收到切换格子消息
function CMonsterSystem:OnChangeMapCheckerEX(setOldChecker,setNewChecker)
	self:SendMapMonsterInfo(true)
end
function CMonsterSystem:OnChangeMapChecker(setOldID,setNewID)
	self:SendMapMonsterInfo(true)
end;

function CMonsterSystem:CheckSingleMonster(dwObjID)
	if self.Node then
		CDriverManager:DelDriver(self.Node)
	end
	self.Node = CDriverManager:AddDriver(eInterval._100ms_i,self,CMonsterSystem.Update)
	local Monster = self.CanSeeMonster[dwObjID]
	if Monster then
		self.AddList[Monster:GetRoleID()]=Monster
		self.DelList[Monster:GetRoleID()] = nil
		return;
	end
	local objPlayer = self:GetPlayer()
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local objMap = mapSystem:GetCurMap()
	local mgrMon = objMap:GetMonsterMgr()
	Monster = mgrMon:GetMonsterInfo(dwObjID)
	if Monster and not Monster:IsDead() then
		self.CanSeeMonster[dwObjID] = Monster
		self.AddList[Monster:GetRoleID()]=Monster
		self.DelList[Monster:GetRoleID()] = nil
	end
end
----------------------------------------------------
-------------------------------------
--消息发送
--------------------------------------
--发送一张地图的所有 Monster 信息
function CMonsterSystem:SendMapMonsterInfo(bChecker)
	local objPlayer = self:GetPlayer()
	local mapSystem = objPlayer:GetSystem("CMapSystem")
	local sysScript = objPlayer:GetSystem("CScriptSystem")
	local Monsters = mapSystem:GetCurMap():GetCanLookMonster(objPlayer) or {}
	if not bChecker then
		--Monsters = mapSystem:GetCurMap():GetMonsterMgr().Nodes
	end
	for dwObjId,Monster in pairs(self.CanSeeMonster) do
		if (not Monsters[dwObjId]) then
			self.CanSeeMonster[dwObjId] = nil
			self.DelList[dwObjId] = sysScript:GetMapPos()
			self.AddList[dwObjId]= nil
		end
	end
	for dwObjId,Monster in pairs(Monsters) do
		if Monster:IsNeedSend() then
			if not self.CanSeeMonster[dwObjId] then
				self.CanSeeMonster[dwObjId] = Monster
				self.AddList[Monster:GetRoleID()]=Monster
				self.DelList[Monster:GetRoleID()] = nil
			end
		end
	end
	if self.Node then
		CDriverManager:DelDriver(self.Node)
	end
	self.Node = CDriverManager:AddDriver(eInterval._100ms_j,self,CMonsterSystem.Update)
	local Map = mapSystem:GetCurMap()
	local mgrMon = Map:GetMonsterMgr()
	mgrMon:SendMonNum(objPlayer)
end

--发送增加某个 Monster 消息
function CMonsterSystem:SendMonsterAddMonster(TbMonster)
	local objPlayer = self:GetPlayer()
	local dwObjId = TbMonster.ObjId
	if not dwObjId then return end;
	self.CanSeeMonster[dwObjId] = TbMonster
	self.DelList[dwObjId] = nil
	self.AddList[dwObjId] = nil
	objPlayer.MonsterAddMonsterMsg{TbMonster=TbMonster:GetSendInfo()}
end
--发送删除某个 Monster 消息
function CMonsterSystem:SendMonsterDelMonster(dwObjId)
	local objPlayer = self:GetPlayer()
	self.CanSeeMonster[dwObjId] = nil
	self.DelList[dwObjId] = nil
	self.AddList[dwObjId] = nil
	objPlayer.MonsterRemoveMonsterMsg{DwMonsterObjId=dwObjId}
end
--发送修改 Monster 消息
function CMonsterSystem:SendMonsterModiMonster(TbMonsterInfo)
	local objPlayer = self:GetPlayer()
	objPlayer.MonsterModiMonster{TbMonsterInfo=TbMonsterInfo}
end
--发送 Monster 播放动作消息
function CMonsterSystem:Play(dwObjId,szActionName)
	--玩家对象
	local objPlayer = self:GetPlayer()
	objPlayer.MonsterPlayActionMsg{DwMonsterObjId=dwObjId,SzActionName=szActionName}
end
--发送怪物死亡处理结束消息
function CMonsterSystem:SendMonsterDeadEnd(dwObjId,dwMonsterId)
	--玩家对象
	local objPlayer = self:GetPlayer()
	objPlayer.MonsterDeadEndMsg{MonsterObjId=dwObjId;MonsterId=dwMonsterId}
end
















