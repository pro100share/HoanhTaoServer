--[[
	怪物系统 AI系统 模版AI
	周长沙
	2012-4-14
--]]
_G.CMonsterAIStateBase = {}
local dwStateId = MonsterState.NONE
-------------------------------------------
--新建
function CMonsterAIStateBase:new()
	local objState = {}
	for k,v in pairs(CMonsterAIStateBase) do
		if type(v)=="function" then
			objState[k] = v
		end
	end
	return objState
end
-------------------------------------------
--基础
--创建
function CMonsterAIStateBase:Create(objMon)
	self.objMon = objMon
	self.dwLastUpdateTime = 0
	self.dwUpdateDelay = 0
end
--进入
function CMonsterAIStateBase:Enter()
	self:GetMon():GetSystem("CMonsterAISystem"):ChangeState(MonsterState.Idel)
end
--更新
function CMonsterAIStateBase:Update()
	if GetCurTime() - self.dwLastUpdateTime >= self.dwUpdateDelay then
		self:GetMon():GetSystem("CMonsterAISystem"):ChangeState(MonsterState.Idel)
	end
end
--离开
function CMonsterAIStateBase:Exit()
end
--------------------------------------------
--事件

--接口
function CMonsterAIStateBase:GetMon()
	return self.objMon
end
--------------------------------------------
--插入
CMonsterAIManager:InsertState(dwStateId,CMonsterAIStateBase)



























