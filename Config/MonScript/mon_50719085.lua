local dwMonsterId = 50719085
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
			{x=16.13,y=22.31,dwSpeed=6};
			-- {x=3.66,y=-23.10,dwSpeed=6};
			-- {x=-5.09,y=-20.25,dwSpeed=6};
			-- {x=15.73,y=-2.13,dwSpeed=6};
			-- {x=11.63,y=11.01,dwSpeed=6};
			-- {x=-8.88,y=10.84,dwSpeed=6};
		}
		Monster:MoveTo(yidong)
		
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	if (Pos.x-16.13)^2+(Pos.y-22.31)^2 < 2^2 then
	
		local yidong = {
			{x=-28,y=-28,dwSpeed=3};
		}
		Monster:MoveTo(yidong)
	
		local D1 = function()
			Monster:Remove()
		end
		Map:AddTimeEvent( 6000,D1)
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