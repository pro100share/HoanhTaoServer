local dwMonsterId = 50702016	--BOSS
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
	
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
local Map = Monster:GetMap()						-----获取地图管理器
	local D1 = function()
	
		local yidong = 
		{
			{x=-13.72,y=-33.32,dwSpeed=6};
			{x=-30.55,y=-37.86,dwSpeed=6};
		}
		Monster:MoveTo(yidong,true)
		
	end
	
	Map:AddTimeEvent( 1000,D1)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------