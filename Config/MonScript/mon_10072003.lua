local dwMonsterId = 10072003
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 10072003,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 8000) then
		return 10072003,1
	else
		return 50602007,1
	end
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















