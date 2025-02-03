local dwMonsterId = 10092014
local MonsterScript = {} 
------九尾灵狐
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	local Pos = Monster:GetVectorPos()		---获得怪物坐标
	
	local SM = MonsterDecision:life(Monster)
	if (SM <= 0.5) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		if sysMonsterBuff then
			sysMonsterBuff:AddBuff(10092014,1,Monster)
		end
	end

	
	if (Pos.x+2.26)^2+(Pos.y+14.49)^2 < 3^3 then
		local yidong = {
			{x=-6,y=-21,dwSpeed=7};
		};
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+6)^2+(Pos.y+21)^2 < 2^2 then
		local yidong = {
			{x=-21,y=-21,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+21)^2+(Pos.y+21)^2 < 2^2 then
		local yidong = {
			{x=-30,y=-32,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+30)^2+(Pos.y+32)^2 < 2^2 then
		local yidong = {
			{x=-32,y=-40,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+32)^2+(Pos.y+40)^2 < 2^2 then
		local yidong = {
			{x=-45,y=-41,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+45)^2+(Pos.y+41)^2 < 2^2 then
		local yidong = {
			{x=-41,y=-25,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+41)^2+(Pos.y+25)^2 < 2^2 then
		local yidong = {
			{x=-19,y=8,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+19)^2+(Pos.y-8)^2 < 2^2 then
		local yidong = {
			{x=-37,y=1,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
	if (Pos.x+37)^2+(Pos.y-1)^2 < 2^2 then
		local yidong = {
			{x=28,y=16,dwSpeed=7};
		}
		Monster:MoveTo(yidong)
	end
	
end

--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)

end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------