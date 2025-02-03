local dwMonsterId = 10082004
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 10082004,1,0
end
--获取下次刷新时间(线路、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	Info.sec = Info.sec + 10
	return Info;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objKiller)
	local sysTask = objKiller:GetSystem("CTaskSystem")
	local Task = sysTask:GetTask(1001) 
	if Task and Task:GetTaskState()==4 then
		local Map = Monster:GetMap()
		local mgrNpc = Map:GetNpcMgr()
		local Pos = Monster:GetVectorPos()
		objKiller.LXY1001 = mgrNpc:Add(10011008,19,-73,0, szName, szTitle,dwObjId,objKiller)
	end
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

		