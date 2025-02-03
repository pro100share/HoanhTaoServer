﻿local dwMonsterId = 50509083
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
			{x=-17.36,y=-20.08,dwSpeed=6};
		}
		Monster:MoveTo(yidong)
		
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x+17.36)^2+(Pos.y+20.08)^2 < 4^2 then
		Monster:Remove()
		
		Map.Boss = (Map.Boss or 0) + 1
			if Map.Boss == 5 then
				mgrMonster:Add(50502011,(3000+dwLevelm+5),50502011,50502011,505020110,-17.53,-20.28)
			end
		
		
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