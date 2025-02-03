local dwMonsterId = 50702023	--小猪
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
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	
		if (Pos.x+38.68)^2+(Pos.y-49.11)^2 < 2^2 then	---是否某个距离之内
			local yidong = 
			{
				{x=-38.85,y=40.99,dwSpeed=3};
				{x=-37.24,y=-28.52,dwSpeed=3};
				{x=-30.01,y=-35.86,dwSpeed=3};
				{x=-12.71,y=-38.09,dwSpeed=3};
				{x=-15.32,y=30.43,dwSpeed=3};
				{x=0.87,y=42.95,dwSpeed=3};
				{x=20.95,y=32.39,dwSpeed=3};
				{x=34.55,y=-26.45,dwSpeed=3};
			}
			Monster:MoveTo(yidong)
		end
		
		if (Pos.x+43.15)^2+(Pos.y-49.93)^2 < 2^2 then	---是否某个距离之内
			local yidong = 
			{
				{x=-42.37,y=41.76,dwSpeed=3};
				{x=-40.43,y=-30.82,dwSpeed=3};
				{x=-30.73,y=-39.36,dwSpeed=3};
				{x=-9.09,y=-40.55,dwSpeed=3};
				{x=-10.27,y=27.10,dwSpeed=3};
				{x=-0.30,y=37.89,dwSpeed=3};
				{x=16.65,y=29.87,dwSpeed=3};
				{x=29.99,y=-27.97,dwSpeed=3};
			}
			Monster:MoveTo(yidong)
		end


end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		
	if not Monster:IsMoving() then
	
		local Pos = Monster:GetVectorPos()
		if (Pos.x-34.55)^2+(Pos.y+26.45)^2 < 2^2  then
			Monster:Remove()	
		end
		 
		if (Pos.x-29.99)^2+(Pos.y+27.97)^2 < 2^2 then
			Monster:Remove()	
		end
	end
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------