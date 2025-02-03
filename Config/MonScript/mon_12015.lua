local dwMonsterId = 12015
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 60011006,1
	end
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	
	
	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 60011006;
	end
	
	local dwRand = math.random(10000);
	if (dwRand <= 3500) then
		return 600110060,1
	elseif (dwRand <= 7000) then
		return 600110061,1
	end
	self.JiShu = self.JiShu + 1;
	--普通
	return 60011006,1;
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)

end
----------------------------------------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
----------------------------------------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















