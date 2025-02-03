local dwMonsterId = 50052001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	local Map = Monster:GetMap()						-----获取地图管理器
	Map.Movie = (Map.Movie or 0) + 1
	
	if Map.Movie == 1 then
			local fnFunction = function(sysScript)
				sysScript:Story(5001004)
			end
			CScriptManager:DoFunction(Monster,fnFunction)
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
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x+26.39)^2+(Pos.y+9.64)^2 < 2^2 then
			local yidong = {
			{x=-26.36,y=-23.26,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+26.36)^2+(Pos.y+23.26)^2 < 2^2 then
			local yidong = {
			{x=-26.39,y=-9.64,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	Map.lr04 = (Map.lr04 or 0) + 1
	if Map.lr04<2 then
		mgrMonster:Add(50052002,50052002,50052002,100040,100320010,-20.05,-26.28)
		mgrMonster:Add(50052002,50052002,50052002,100040,100320010,-20.12,-13.96)
		mgrMonster:Add(50052002,50052002,50052002,100040,100320010,-33.66,-13.32)
		mgrMonster:Add(50052002,50052002,50052002,100040,100320010,-32.96,-25.34)
		
		mgrMonster:DelayAdd(50052002,50052002,50052002,100040,100320010,-20.05,-26.28,dwObjId,1000)
		mgrMonster:DelayAdd(50052002,50052002,50052002,100040,100320010,-20.12,-13.96,dwObjId,1000)
		mgrMonster:DelayAdd(50052002,50052002,50052002,100040,100320010,-33.66,-13.32,dwObjId,1000)
		mgrMonster:DelayAdd(50052002,50052002,50052002,100040,100320010,-32.96,-25.34,dwObjId,1000)
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------