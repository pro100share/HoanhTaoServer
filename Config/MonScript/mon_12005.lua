local dwMonsterId = 12005	--王重阳
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302073,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 50302073,1
	else
		return 503020730,1
	end
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
		
		
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
		
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------