local dwMonsterId = 50062003
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 50702021,1,0
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
			if (Pos.x-25.62)^2+(Pos.y-21.36)^2 < 2^2 then
				local yidong = {
				{x=21.23,y=13.86,dwSpeed=2};
				}
				Monster:MoveTo(yidong)
			end
			
			if (Pos.x-24.32)^2+(Pos.y-23.29)^2 < 2^2 then
				local yidong = {
				{x=18.15,y=17.68,dwSpeed=2};
				}
				Monster:MoveTo(yidong)
			end
			
			if (Pos.x-22.52)^2+(Pos.y-24.90)^2 < 2^2 then
				local yidong = {
				{x=14.88,y=21.04,dwSpeed=2};
				}
				Monster:MoveTo(yidong)
			end
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		
		if (Pos.x-21.23)^2+(Pos.y-13.86)^2 < 2^2 then
			Map.lr500601 = (Map.lr500601 or 0) + 1
			if Map.lr500601<2 then
				local yidong = {
				{x=21.23,y=13.86,dwSpeed=2};
				}
				Monster:MoveTo(yidong,true)
			end
		end
		
		if (Pos.x-18.15)^2+(Pos.y-17.68)^2 < 2^2 then
			Map.lr500602 = (Map.lr500602 or 0) + 1
			if Map.lr500602<2 then
				local yidong = {
				{x=18.15,y=17.68,dwSpeed=2};
				}
				Monster:MoveTo(yidong,true)
			end
		end
		
		if (Pos.x-14.88)^2+(Pos.y-21.04)^2 < 2^2 then
			Map.lr500603 = (Map.lr500603 or 0) + 1
			if Map.lr500603<2 then
				local yidong = {
				{x=14.88,y=21.04,dwSpeed=2};
				}
				Monster:MoveTo(yidong,true)
			end
		end	
		
		
end
--受到攻击时执行
 function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)
 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
