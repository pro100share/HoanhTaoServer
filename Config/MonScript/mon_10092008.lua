local dwMonsterId = 10092008
local MonsterScript = {}
------蒙古力士
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,objPlayer)




	return 10092008,1,0
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)

end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------