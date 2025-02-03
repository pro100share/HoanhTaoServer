--[[
	怪物系统 AI系统 强走状态
	周长沙
	2012-7-17
--]]
_G.CMonsterAIForceRun = CMonsterAIStateBase:new()
local dwStateId = MonsterState.ForceRun
-----------------------------------------------------
-----------------------------------------------------
--新建
function CMonsterAIForceRun:new()
	local objState = {}
	for k,v in pairs(CMonsterAIForceRun) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-----------------------------------------------------
--创建
function CMonsterAIForceRun:Create(objMon,sysMonsterAI)
	self.objMon = objMon
	self.sysMonsterAI = sysMonsterAI
	self.path = {}
	self.MovePath = {}
	self.bFight = false
	self.bForceRun = false
end
--进入
function CMonsterAIForceRun:Enter(path,bFight)
	local objMon = self:GetMon()
	self.path = path or self.path
	self.bFight = bFight or self.bFight
	self.bForceRun = true
	objMon:GetMgr():InsertForceNode(objMon:GetRoleID(),objMon)
end
--更新
function CMonsterAIForceRun:SlowUpdate()
	
	local objMon = self:GetMon()
	local Map = objMon:GetMap()
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterSkill = objMon:GetSystem("CMonsterSkillSystem")
	if objMon:IsDead() then
		self:Stop()
		return
	end
	if self.bFight then
		local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
		local dwEnemyType,dwRole = sysMonsterAI:GetHatredMaxRole()
		--仇恨
		if dwRole > 0 then
			sysMonsterAI:SetFightPos(sysMonsterMove:GetVPos())
			if sysMonsterAI.RunAwayOnly and sysMonsterAI.RunAwayOnly > 0 then
				sysMonsterAI:ChangeState(MonsterState.RunAway)
			else
				sysMonsterAI:ChangeState(MonsterState.FightIng)
			end
			objMon:SayOnFightStart()
			return;
		end
		--索敌
		local AIIdel = sysMonsterAI:GetStateNode(MonsterState.Idel)
		local dwRoleId,Player = AIIdel:OnIdelSearchEnemy()
		if dwRoleId then
			sysMonsterAI:AddHatred(enEntType.eEntType_Player,dwRoleId,1)
			return
		end
	end
	if sysMonsterMove:IsMoving() then
		return
	end
	if self.MovePath[1] then
		local vPos = sysMonsterMove:GetVPos()
		if (vPos.x-self.MovePath[1].x)^2+(vPos.y-self.MovePath[1].y)^2 > 2 then
			--先设置速度，再移动
			sysMonsterSkill:SetMoveSpeed(self.MovePath.dwSpeed)
			sysMonsterMove:StartMove(self.MovePath[1].x,self.MovePath[1].y)
		else
			table.remove(self.MovePath,1)
		end
		return;
	elseif self.path[1] then
		self.MovePath = Map:GetPath(sysMonsterMove:GetVPos(),self.path[1]) or {}
		if self.MovePath then
			self.MovePath.dwSpeed = self.path[1].dwSpeed
		end
		table.remove(self.path,1)
		return;
	end
	--脚本
	if objMon.tbFun and objMon.tbFun.CBMonsterOnForceRunEnd then
		if objMon.tbFun:CBMonsterOnForceRunEnd(objMon) then
			self.bForceRun = false
			objMon:ChangeAI(MonsterState.NONE)
		end
	end
end
--离开
function CMonsterAIForceRun:Exit()
	local objMon = self:GetMon()
	objMon:GetMgr():RemoveForceNode(objMon:GetRoleID())
end
-----------------------------------------------------
--事件
-----------------------------------------------------
function CMonsterAIForceRun:Stop()
	self.path = {}
	self.MovePath = {}
	self.bForceRun = false
end
-----------------------------------------------------
--方法
function CMonsterAIForceRun:GetbForceRun() 
	return self.bForceRun
end
-----------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIForceRun)



















