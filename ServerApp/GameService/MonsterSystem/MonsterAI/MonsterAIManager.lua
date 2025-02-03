--[[
	怪物系统 AI系统 AI状态管理器
	周长沙
	2012-4-14
--]]
_G.CMonsterAIManager = {}
-------------------------------------------
CMonsterAIManager.State = {}
-------------------------------------------
--插入一个状态
function CMonsterAIManager:InsertState(dwStateId,CState)
	self.State[dwStateId] = CState
end
--获得某个id的状态
function CMonsterAIManager:GetState(dwStateId)
	local CState = self.State[dwStateId]
	if not CState then return end;
	return CState:new()
end
--获得所有状态
function CMonsterAIManager:GetAllState()
	local AllState = {}
	for k,v in pairs(self.State) do
		AllState[k] = v:new()
	end
	return AllState
end
-------------------------------------------





















