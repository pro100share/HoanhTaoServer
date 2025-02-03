local dwMonsterId = 50720017	--BOSS
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
	local Pos = Monster:GetVectorPos()		---获得怪物坐标

		if (Pos.x+68.14)^2+(Pos.y+63.61)^2 < 2^2 then

			local yidong = {
				{x=-2.85,y=-40.96,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
			}
			Monster:MoveTo(yidong,true)

		elseif (Pos.x-72.66)^2+(Pos.y-55.16)^2 < 2^2 then

			local yidong = {
				{x=5.32,y=35.17,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
			}
			Monster:MoveTo(yidong,true)

		elseif (Pos.x+61.85)^2+(Pos.y-67.30)^2 < 2^2 then

			local yidong = {
				{x=2.88,y=36.14,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
			}
			Monster:MoveTo(yidong,true)

		else

			local yidong = {
				{x=-3.07,y=-43.44,dwSpeed=1.3};
				{x=-2.31,y=-2.49,dwSpeed=1.3};
			}
			Monster:MoveTo(yidong,true)

		end
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