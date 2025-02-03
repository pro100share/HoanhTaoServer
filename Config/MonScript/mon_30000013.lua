﻿local dwMonsterId = 30000013	--雪人大
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
	sysMonsterBuff:AddBuff(50700014,1,Monster)
    	
end

--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------