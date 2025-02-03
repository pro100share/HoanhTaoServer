local dwMonsterId = 50052002
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
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
		if (Pos.x+23.43)^2+(Pos.y+7.60)^2 < 2^2 then
			local yidong = {
			{x=-24.04,y=-26.26,dwSpeed=2.2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+24.04)^2+(Pos.y+26.26)^2 < 2^2 then
			local yidong = {
			{x=-23.43,y=-7.60,dwSpeed=2.2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+28.59)^2+(Pos.y+7.49)^2 < 2^2 then
			local yidong = {
			{x=-28.91,y=-24.98,dwSpeed=2.2};
			}
			Monster:MoveTo(yidong,true)
		end
		
		if (Pos.x+28.91)^2+(Pos.y+24.98)^2 < 2^2 then
			local yidong = {
			{x=-28.59,y=-7.49,dwSpeed=2.2};
			}
			Monster:MoveTo(yidong,true)
		end
		
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------