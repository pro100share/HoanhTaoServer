local dwMonsterId = 10082016
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x+21.07)^2+(Pos.y+36.66)^2 < 1^2 then
			local yidong = {
			{x=-30.04,y=-36.80,dwSpeed=2};
			{x=-21.07,y=-36.66,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+17.92)^2+(Pos.y+36.92)^2 < 1^2 then
			local yidong = {
			{x=-30.04,y=-36.80,dwSpeed=2};
			{x=-21.07,y=-36.66,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
		------------------
		if (Pos.x+14.25)^2+(Pos.y+28.09)^2 < 1^2 then
			local yidong = {
			{x=-33.33,y=-27.32,dwSpeed=2};
			{x=-17.41,y=-27.80,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+17.41)^2+(Pos.y+27.80)^2 < 1^2 then
			local yidong = {
			{x=-33.33,y=-27.32,dwSpeed=2};
			{x=-17.41,y=-27.80,dwSpeed=2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		
		
		
		
end
---------------------------------------------
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






















