local dwMonsterId = 10042011
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 52,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand <=4000) then
		return 10042009,1
	end
	return 52,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	--
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------