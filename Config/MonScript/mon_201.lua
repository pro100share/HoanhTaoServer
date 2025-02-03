local dwMonsterId = 201
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)

end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	--第一个参数Monster，第3个参数喊话的起点，第4个从多少秒开始倒计时
	MonsterDecision:Yell(Monster,600,30)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	--
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------