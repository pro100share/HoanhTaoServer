local dwMonsterId = 50720099
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

		local yidong = {
			{x=-5.08,y=-8.32,dwSpeed=6};
		}
		Monster:MoveTo(yidong)

		local S1 = function()
			Monster:Say(560)
		end
		local S2 = function()
			Monster:Say(561)
		end
		local S3 = function()
			Monster:Say(11000)---通用怪物空喊话
		end
		Map:AddTimeEvent( 300,S1)
		Map:AddTimeEvent( 3000,S2)
		Map:AddTimeEvent( 5500, S3)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器

	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	if (Pos.x+5.08)^2+(Pos.y+8.32)^2 < 2^2 then

		local D1 = function()
			Monster:Remove()
		end
		Map:AddTimeEvent( 4500,D1)
	end

end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------