--[[
	怪物系统 AI系统 空闲状态
	周长沙
	2012-4-16
--]]

_G.CMonsterAIIdel = CMonsterAIStateBase:new()
local dwStateId = MonsterState.Idel
------------------------------------------------
local function CopyTable(t)
	local t = t or {}
	local out = {}
	for k,v in pairs(t) do
		if type(v)=="table" then
			out[k] = CopyTable(v)
		else
			out[k] = v
		end
	end
	return out;
end
------------------------------------------------
--新建
function CMonsterAIIdel:new()
	local objState = {}
	for k,v in pairs(CMonsterAIIdel) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
---------------------------------------------------
-----------------------------------------------基础
--创建
function CMonsterAIIdel:Create(objMon,sysMonsterAI)
	self.objMon = objMon											--怪物对象
	self.sysMonsterAI = sysMonsterAI								--AI系统
	self.dwLastSearchEnemyTime = GetCurTime()								--上次索敌时间
	self.dwSearchEnemyDelay = sysMonsterAI.dwSearchEnemyDelay		--索敌延迟
	self.fAlertDis = sysMonsterAI.fAlertDis							--警戒距离
	self.fWorlkDis = sysMonsterAI.fWorlkDis							--散步距离
	self.dwMoveDelay = (8000+math.random(2000,8000))*2				--空闲移动延迟
	self.tbPath = {}												--寻路路径
	self.Move = {}
	self.IndexMove = 0
	self:SetMove()
end
--进入
function CMonsterAIIdel:Enter(dwBeginMode)
	local objMon = self:GetMon()
	if objMon.DataInfo.bNoRevert and (objMon.DataInfo.bNoRevert ~= 0) then
		--do return end;
	else
		if dwBeginMode ~= MonsterState.Dead then
			local sysMonsterSkill = objMon:GetSystem("CMonsterSkillSystem")
			sysMonsterSkill:FullHPAndMP()
		end
	end
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	sysMonsterMove.dwLastWalkStopTime = GetCurTime()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local AIForceRun = sysMonsterAI:GetStateNode(MonsterState.ForceRun)
	if AIForceRun:GetbForceRun() then
		sysMonsterAI:ChangeState(MonsterState.ForceRun)
	else
		objMon:GetMgr():InsertIdelNode(objMon:GetRoleID(),objMon)
	end
end
--更新
function CMonsterAIIdel:Update()
	
	local objMon = self:GetMon()
	
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local dwEnemyType,dwRole = sysMonsterAI:GetHatredMaxRole()
	--仇恨
	if dwRole > 0 then
		--print("CMonsterAIIdel:Update dwEnemyType,dwRole ",dwEnemyType,dwRole)
		if sysMonsterAI.RunAwayOnly and sysMonsterAI.RunAwayOnly > 0 then
			sysMonsterAI:ChangeState(MonsterState.RunAway)
		else
			sysMonsterAI:ChangeState(MonsterState.FightIng)
		end
		return;
	end
	--索敌OnIdelSearchPlayer
	if GetCurTime() - self.dwLastSearchEnemyTime > self.dwSearchEnemyDelay then
		if objMon:IsScript() then
			if objMon.tbFun and objMon.tbFun.CBMonsterOnWarn then
				local sys = self:OnIdelSearchPlayer()
				for _,sysScript in pairs(sys) do
					objMon.tbFun:CBMonsterOnWarn(objMon,sysScript)
				end
			end
			return;
		end
		local dwRoleId,Player = self:OnIdelSearchEnemy()
		if dwRoleId then
			sysMonsterAI:AddHatred(enEntType.eEntType_Player,dwRoleId,1)
			return
		end
	end
	
	--移动
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	if sysMonsterMove:IsMoving() then
		return
	end
	table.remove(self.tbPath,1)
	if #self.tbPath > 0 then
		sysMonsterMove:StartMove(self.tbPath[1].x,self.tbPath[1].y)
		return
	end
	if GetCurTime() - sysMonsterMove:GetLastStopTime() > self.dwMoveDelay then
		self:OnIdelMove()
		return
	end
	--脚本
	if objMon.tbFun and objMon.tbFun.CBMonsterOnIdel then
		objMon.tbFun:CBMonsterOnIdel(objMon)
	end
end
--离开
function CMonsterAIIdel:Exit()
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	sysMonsterAI:SetFightPos(sysMonsterMove:GetVPos())
	objMon:SayOnFightStart()
	objMon:GetMgr():RemoveIdelNode(objMon:GetRoleID())
end

function CMonsterAIIdel:FastUpdate()
	local objMon = self:GetMon()
	
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local dwEnemyType,dwRole = sysMonsterAI:GetHatredMaxRole()
	--仇恨
	if dwRole > 0 then
		--print("CMonsterAIIdel:FastUpdate dwEnemyType,dwRole ",dwEnemyType,dwRole)
		if sysMonsterAI.RunAwayOnly and sysMonsterAI.RunAwayOnly > 0 then
			sysMonsterAI:ChangeState(MonsterState.RunAway)
		else
			sysMonsterAI:ChangeState(MonsterState.FightIng)
		end
		return;
	end
	if self.fAlertDis < 1 then return end;
	--索敌OnIdelSearchPlayer
	if GetCurTime() - self.dwLastSearchEnemyTime > self.dwSearchEnemyDelay then
		if objMon:IsScript() then
			if objMon.tbFun and objMon.tbFun.CBMonsterOnWarn then
				local sys = self:OnIdelSearchPlayer()
				for _,sysScript in pairs(sys) do
					objMon.tbFun:CBMonsterOnWarn(objMon,sysScript)
				end
			end
			return;
		end
		local dwRoleId,Player = self:OnIdelSearchEnemy()
		if dwRoleId then
			sysMonsterAI:AddHatred(enEntType.eEntType_Player,dwRoleId,1)
			return
		end
	end
end

function CMonsterAIIdel:SlowUpdate()
	local objMon = self:GetMon()
	--移动
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	if sysMonsterMove:IsMoving() then
		return
	end
	table.remove(self.tbPath,1)
	if #self.tbPath > 0 then
		sysMonsterMove:StartMove(self.tbPath[1].x,self.tbPath[1].y)
		return
	end
	if GetCurTime() - sysMonsterMove:GetLastStopTime() > self.dwMoveDelay then
		self:OnIdelMove()
		return
	end
	--脚本
	if objMon.tbFun and objMon.tbFun.CBMonsterOnIdel then
		objMon.tbFun:CBMonsterOnIdel(objMon)
	end
end
--------------------------------------------
----------------------------------------事件
--被攻击
--------------------------------------------
----------------------------------------方法
--索敌
function CMonsterAIIdel:OnIdelSearchEnemy()
	--do return end;
	self.dwLastSearchEnemyTime = GetCurTime()
	local fSearchDis = self.fAlertDis
	local objMon = self:GetMon()
	local vMonPos = objMon:GetSystem("CMonsterMoveSystem"):GetVPos()
	local Map = objMon:GetMap()
	local Players = Map:GetMonsterRangePlayer(objMon,fSearchDis)
	-- if dwRoleID and dwRoleID~=0 then
		-- return dwRoleID
	-- end
	for dwRoleID,Player in pairs(Players) do
		local sysBattle = Player:GetSystem("CBattleSystem");
		if not sysBattle then return end;
		--只攻击非死亡状态的玩家
		if sysBattle:IsCanBeAttackByMonster() then
			local sysMapSystem = Player:GetSystem("CMapSystem");
			if not sysMapSystem then return end;
			-- local fPlayerX = sysMapSystem.fXPos
			-- local fPlayerY = sysMapSystem.fYPos
			local vecPlyPos = sysMapSystem:GetPlayerPos();
			if (vecPlyPos.x-vMonPos.x)^2 + (vecPlyPos.y-vMonPos.y)^2 < fSearchDis^2 then
				local dwRoleID = Player:GetRoleID()
				return dwRoleID,Player
			end
		end
	end
end
--移动
function CMonsterAIIdel:OnIdelMove()
	if self.fWorlkDis==0 then return end;
	local objMon = self:GetMon()
	local Map = objMon:GetMap()
	local vBorn = objMon:GetBornPos()
	if (not vBorn.x) or (not vBorn.y) then
		--print("Mon Err : Not Born Pos MonsterId:"..objMon.dwMonsterId)
		--print("x="..tostring(vBorn.x),"y="..tostring(vBorn.y))
		return;
	end
	--self.tbPath.x = vBorn.x+math.random(-self.fWorlkDis,self.fWorlkDis)
	--self.tbPath.y = vBorn.y+math.random(-self.fWorlkDis,self.fWorlkDis)
	self.IndexMove = math.mod(self.IndexMove,6)+1
	
	
	
	self.tbPath = CopyTable(self.Move[self.IndexMove] or {})
	if not self.tbPath then
		self.tbPath = {}
	end
end
--寻找触发玩家
function CMonsterAIIdel:OnIdelSearchPlayer()
	self.dwLastSearchEnemyTime = GetCurTime()
	local sys = {}
	local fSearchDis = self.fAlertDis
	local objMon = self:GetMon()
	local vMonPos = objMon:GetSystem("CMonsterMoveSystem"):GetVPos()
	local Map = objMon:GetMap()
	local Players = Map:GetCanSeePlayer(objMon)
	for dwRoleID,Player in pairs(Players) do
		local sysBattle = Player:GetSystem("CBattleSystem");
		if not sysBattle then return sys end;
		--只攻击非死亡状态的玩家
		if sysBattle:IsCanBeAttackByMonster() then
			local sysMapSystem = Player:GetSystem("CMapSystem");
			if not sysMapSystem then return sys end;
			-- local fPlayerX = sysMapSystem.fXPos
			-- local fPlayerY = sysMapSystem.fYPos
			local vecPlyPos = sysMapSystem:GetPlayerPos();
			if (vecPlyPos.x-vMonPos.x)^2 + (vecPlyPos.y-vMonPos.y)^2 < fSearchDis^2 then
				local sysScript = Player:GetSystem("CScriptSystem")
				table.insert(sys,sysScript)
			end
		end
	end
	return sys
end
--------------------------------------------
function CMonsterAIIdel:SetMove()
	if self.fWorlkDis==0 then return end;
	local objMon = self:GetMon()
	local Map = objMon:GetMap()
	if not Map then return end;
	local vBorn = objMon:GetBornPos()
	local x,y
	for i=1,5,2 do
		x = vBorn.x+math.random(-self.fWorlkDis,self.fWorlkDis)
		y = vBorn.y+math.random(-self.fWorlkDis,self.fWorlkDis)
		self.Move[i] = Map:GetPath(vBorn,{x=x,y=y})
		self.Move[i+1] = Map:GetPath({x=x,y=y},vBorn) 
	end
end



--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIIdel)



