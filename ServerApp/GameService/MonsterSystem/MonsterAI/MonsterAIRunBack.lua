--[[
	怪物系统 AI系统 返回状态
	周长沙
	2012-4-17
--]]
_G.CMonsterAIRunBack = CMonsterAIStateBase:new()
local dwStateId = MonsterState.RunBack
-----------------------------------------------------
--新建
function CMonsterAIRunBack:new()
	local objState = {}
	for k,v in pairs(CMonsterAIRunBack) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-----------------------------------------------------
--创建
function CMonsterAIRunBack:Create(objMon,sysMonsterAI)
	self.objMon = objMon
	self.sysMonsterAI = sysMonsterAI
end
--进入
function CMonsterAIRunBack:Enter()
	local objMon = self:GetMon()
	local Map =objMon:GetMap()
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	sysMonsterAI:ClsHatred()
	local vFightPos = sysMonsterAI:GetFightPos()
	local vMonPos = objMon:GetSystem("CMonsterMoveSystem"):GetVPos()
	if (vFightPos.x-vMonPos.x)^2 + (vFightPos.y-vMonPos.y)^2 > 3 then
		local vTargetPos = {{x=0,y=0},{x=vFightPos.x,y=vFightPos.y}}--Map:GetPath(vMonPos,vFightPos)
		if vTargetPos then 
			sysMonsterMove:StartMove(vTargetPos[2].x,vTargetPos[2].y)
		else
			sysMonsterAI:ChangeState(MonsterState.Idel)
		end
	else
		sysMonsterAI:ChangeState(MonsterState.Idel)
	end
end
--更新
function CMonsterAIRunBack:Update()
	do return end;
	local objMon = self:GetMon()
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	if not sysMonsterMove:IsMoving() then
		sysMonsterAI:ChangeState(MonsterState.Idel)
	end
end
--离开
function CMonsterAIRunBack:Exit()
end
-----------------------------------------------------
--事件
function CMonsterAIRunBack:OnMoveEnd()
	self:Enter()
	--[[
	local objMon = self:GetMon()
	local sysMonsterMove = objMon:GetSystem("CMonsterMoveSystem")
	local sysMonsterAI = objMon:GetSystem("CMonsterAISystem")
	sysMonsterAI:ChangeState(MonsterState.Idel)
	--]]
end
-----------------------------------------------------
--方法
-----------------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIRunBack)



















