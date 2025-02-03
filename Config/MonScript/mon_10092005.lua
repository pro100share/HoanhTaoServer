local dwMonsterId = 10092005
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302010,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 50302010,1
	else
		return 503020100,1
	end
end
---------------------------------------------
---获取下次刷新时间(线路、地图、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	
	if (dwHour == 21 and  dwMin >= 30) or (dwHour>=22) then
		Info.day = dwDay + 1
		Info.hour = 10
		Info.min = 0
		Info.sec = 0
	elseif (dwHour >20 and dwMin>=30) and (dwHour <21 and dwMin<30) then
		Info.hour = 21
		Info.min = 30
		Info.sec = 0
	elseif (dwHour >19 and dwMin>=30) and (dwHour <20 and dwMin<30) then
		Info.hour = 20
		Info.min = 30
		Info.sec = 0
	elseif (dwHour >18 and dwMin>=30) and (dwHour <19 and dwMin<30) then
			Info.hour = 19
			Info.min = 30
			Info.sec = 0
	elseif (dwHour >16 and dwMin>=30) and (dwHour <17 and dwMin<30) then
			Info.hour = 17
			Info.min = 30
			Info.sec = 0
	elseif (dwHour >15 and dwMin>=30) and (dwHour <16 and dwMin<30) then
			Info.hour = 16
			Info.min = 30
			Info.sec = 0
	elseif (dwHour >14 and dwMin>=30) and (dwHour <15 and dwMin<30) then
			Info.hour = 15
			Info.min = 30
			Info.sec = 0
	elseif (dwHour >11 and dwMin>=30) and (dwHour <12 and dwMin<30) then
			Info.hour = 12
			Info.min = 0
			Info.sec = 0
	elseif (dwHour >10 and dwMin>=30) and (dwHour <11 and dwMin<30) then
			Info.hour = 11
			Info.min = 0
			Info.sec = 0
	elseif (dwHour >9 and dwMin>=30) and (dwHour <10 and dwMin<30) then
			Info.hour = 10
			Info.min = 0
			Info.sec = 0
	end
	
	--[[Info.sec = Info.sec + 10
	if dwLine==1 then
		Info.sec = Info.sec + 30
	else
		Info.year = Info.year  + 20
	end
	--]]
	return Info;
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster)
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






















