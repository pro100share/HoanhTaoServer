local dwMonsterId = 50042005
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
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	
	local yidong = 
	{
		{x=-8.88,y=10.84,dwSpeed=3};
	}
	Monster:MoveTo(yidong,true)
	
	local D1 = function()
	Monster:Say(421)
	end
	
	Map:AddTimeEvent( 1000, D1)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
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