local dwMonsterId = 50092005
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	

	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 200020010
	end
	self.JiShu = self.JiShu + 1;
	--普通
	return 7000,1;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)

end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
--------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















