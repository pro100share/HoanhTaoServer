local dwMonsterId = 53
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	return 1,1,0
end
--获取下次刷新时间(线路、地图、年、月、日、星期、时、分、秒)
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	Info.sec = Info.sec + 10
	return Info,Pos;
end
---------------------------------------------
--空闲时执行
function MonsterScript:CBMonsterOnIdel(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objKiller)
end
--受到攻击时执行
local path = {
	{x=-14,y=-25,dwSpeed=8};
	{x=-20,y=-38,dwSpeed=8};
	{x=-37,y=-30,dwSpeed=8};
	{x=-37,y=-20,dwSpeed=8};
}
function MonsterScript:CBMonsterOnAttacked(Monster,objEnemy,dwSkillID)
	local rand = math.random(1, #path);
	Monster:MoveTo({path[rand]})
end
function MonsterScript:CBMonsterOnBorn(Monster)
	--print("zzzzzzzzzzzzcccccccccccccccccsssssssssssssssssss")
	-- local path = {
		-- {x=-26,y=-24,dwSpeed=1};
		-- {x=-34,y=-26,dwSpeed=2};
		-- {x=-32,y=-20,dwSpeed=3};
		-- {x=-26,y=-24,dwSpeed=4};
		-- {x=-34,y=-26,dwSpeed=5};
		-- {x=-32,y=-20,dwSpeed=6};
		-- {x=-26,y=-24,dwSpeed=7};
		-- {x=-34,y=-26,dwSpeed=8};
		-- {x=-32,y=-20,dwSpeed=7};
		-- {x=-26,y=-24,dwSpeed=5};
		-- {x=-34,y=-26,dwSpeed=3};
		-- {x=-32,y=-20,dwSpeed=1};
	-- }
	-- Monster:MoveTo(path)
	--Monster:MoveTo(path,true) ----带true 是否需要怪物正常AI
end
function MonsterScript:CBMonsterOnForceRunEnd(Monster)
	--print("zzzzzzzzzzzzcccccccccccccccccsssssssssssssssssss")
	-- local path = {
		-- {x=-26,y=-24,dwSpeed=1};
		-- {x=-34,y=-26,dwSpeed=2};
		-- {x=-32,y=-20,dwSpeed=3};
		-- {x=-26,y=-24,dwSpeed=4};
		-- {x=-34,y=-26,dwSpeed=5};
		-- {x=-32,y=-20,dwSpeed=6};
		-- {x=-26,y=-24,dwSpeed=7};
		-- {x=-34,y=-26,dwSpeed=8};
		-- {x=-32,y=-20,dwSpeed=7};
		-- {x=-26,y=-24,dwSpeed=5};
		-- {x=-34,y=-26,dwSpeed=3};
		-- {x=-32,y=-20,dwSpeed=1};
	-- }
	-- Monster:MoveTo(path)
	return true;  ---是否返回出生点
end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------