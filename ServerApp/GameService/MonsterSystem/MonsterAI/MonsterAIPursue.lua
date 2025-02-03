--[[
	怪物系统 AI系统 追击状态
	周长沙
	2012-4-17
--]]

_G.CMonsterAIPursue = CMonsterAIStateBase:new()
local dwStateId = MonsterState.Pursue
------------------------------------------------
--新建
function CMonsterAIPursue:new()
	local objState = {}
	for k,v in pairs(CMonsterAIPursue) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-------------------------------------------------
--创建
function CMonsterAIPursue:Create(objMon,sysMonsterAI)
	self.objMon = objMon						--怪物对象
	self.sysMonsterAI = sysMonsterAI			--AI系统
	self.dwLastPursueTime = 0					--上次追击时间
	self.dwPursueDelay = 10000					--追击延迟时间
	self.dwTargetType = 0						--追击对象类型
	self.dwTargetRoleId = 0						--追击对象
	self.dwSkillDis = 0							--技能距离
	self.fPursueDis = sysMonsterAI.fPursueDis	--追击距离
	self.vTargetPos = {x=0;y=0};				--目的地点
end
--进入
function CMonsterAIPursue:Enter()
	local dwNowTime = GetCurTime()
	self.dwLastPursueTime = dwNowTime
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local Map =objMon:GetMap()
	
	self.dwSkillDis = sysMonsterAI:GetSkillDis()
	self.dwTargetType, self.dwTargetRoleId = sysMonsterAI:GetTargetRoleId();
	
	local objTarget = objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(sysMonsterAI:GetTargetRoleId());
	
	if objTarget then
		local vTargetPos = objMon:GetSystem("CMonsterSkillSystem"):GetTargetPos(objTarget);
		
		local vMonPos = sysMonsterMove:GetVPos()
		local fSkillDis = self.dwSkillDis-0.5
		local fDir = math.random(-math.pi*10000/3,math.pi*10000/3)/10000
		local dwXSign = 0
		if vMonPos.x~=vTargetPos.x then
			dwXSign = (vMonPos.x-vTargetPos.x)/math.abs(vMonPos.x-vTargetPos.x)
		end
		local dwYSign = 0
		if vMonPos.y~=vTargetPos.y then
			dwYSign = (vMonPos.y-vTargetPos.y)/math.abs(vMonPos.y-vTargetPos.y)
		end

		
		self.vTargetPos.x = (vTargetPos.x+dwXSign*fSkillDis*math.cos(fDir))
		self.vTargetPos.y = (vTargetPos.y+dwYSign*fSkillDis*math.sin(fDir))

		self.vTargetPos = {{x=0,y=0},{x=self.vTargetPos.x,y=self.vTargetPos.y}}--Map:GetPath(vMonPos,self.vTargetPos) 
		if sysMonsterMove:IsMoving() then
			sysMonsterMove:StopMove()
		end
		sysMonsterMove:StartMove(self.vTargetPos[2].x,self.vTargetPos[2].y)
	else
		--print("FightIng")
		sysMonsterAI:ChangeState(MonsterState.FightIng)
	end
end
--更新
function CMonsterAIPursue:Update()
	do return end;
	local dwNowTime = GetCurTime()
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local Map =objMon:GetMap()
	local vFightPos = sysMonsterAI:GetFightPos()
	local vMonPos = sysMonsterMove:GetVPos()
	if math.sqrt((vFightPos.x-vMonPos.x)^2+(vFightPos.y-vMonPos.y)^2) > self.fPursueDis then
		sysMonsterAI:ChangeState(MonsterState.RunBack)
		return
	end
	if (dwNowTime-self.dwLastPursueTime>self.dwPursueDelay) or (not sysMonsterMove:IsMoving()) then
		local objTarget = objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(self.dwTargetType, self.dwTargetRoleId);
		if not objTarget then--玩家不存在
			sysMonsterAI:ChangeState(MonsterState.FightIng)
			return
		end
		
		local vTargetPos = objMon:GetSystem("CMonsterSkillSystem"):GetTargetPos(objTarget);
		if math.sqrt((vTargetPos.x-vMonPos.x)^2+(vTargetPos.y-vMonPos.y)^2) > self.dwSkillDis then
			self:Enter()
		else
			sysMonsterAI:ChangeState(MonsterState.FightIng)
		end
	end
end
--离开
function CMonsterAIPursue:Exit()

end
-------------------------------------------------
--事件
function CMonsterAIPursue:OnMoveEnd()
	--print("CMonsterAIPursue:OnMoveEnd()")
	local objMon = self:GetMon()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local Map =objMon:GetMap()
	local vFightPos = sysMonsterAI:GetFightPos()
	local vMonPos = sysMonsterMove:GetVPos()
	if math.sqrt((vFightPos.x-vMonPos.x)^2+(vFightPos.y-vMonPos.y)^2) > self.fPursueDis then
		sysMonsterAI:ChangeState(MonsterState.RunBack)
		return
	end
	if (not sysMonsterMove:IsMoving()) then
		local objTarget =objMon:GetSystem("CMonsterSkillSystem"):GetObjTarget(self.dwTargetType, self.dwTargetRoleId);
		if not objTarget then--玩家不存在
			sysMonsterAI:ChangeState(MonsterState.FightIng)
			return
		end
		
		local vTargetPos = objMon:GetSystem("CMonsterSkillSystem"):GetTargetPos(objTarget);
		
		if math.sqrt((vTargetPos.x-vMonPos.x)^2+(vTargetPos.y-vMonPos.y)^2) > self.dwSkillDis then
			self:Enter()
		else
			sysMonsterAI:ChangeState(MonsterState.FightIng)
		end
	end
end
-------------------------------------------------
--方法 
-------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIPursue)







