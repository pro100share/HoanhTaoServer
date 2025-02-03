local dwMonsterId = 10052002
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 10052002,1,0
end
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objKiller)
end		
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objEnemy,dwSkillID)
end

--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)

	
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------

		