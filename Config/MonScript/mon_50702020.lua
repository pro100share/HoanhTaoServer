local dwMonsterId = 50702020	--BOSS
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end

	local dwRand = math.random(10000);
	if (dwRand < 1000) then
		return 7001,1
	elseif (dwRand < 2000) then
		return 7003,1
	elseif (dwRand < 3000) then
		return 	7005,1
	else
		return 7000,1
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
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local yidong = 
	{
		{x=-38.97,y=-29.85,dwSpeed=5};
		{x=-30.55,y=-37.86,dwSpeed=5};
		{x=-11.51,y=-39.13,dwSpeed=5};
		{x=-12.35,y=28.47,dwSpeed=5};
		{x=0.49,y=40.23,dwSpeed=5};
		{x=18.80,y=30.19,dwSpeed=5};
		{x=32.62,y=-29.02,dwSpeed=5};
		{x=18.80,y=30.19,dwSpeed=5};
		{x=0.49,y=40.23,dwSpeed=5};
		{x=-12.35,y=28.47,dwSpeed=5};
		{x=-11.51,y=-39.13,dwSpeed=5};
		{x=-30.55,y=-37.86,dwSpeed=5};
		{x=-38.97,y=-29.85,dwSpeed=5};
	}
	Monster:MoveTo(yidong,true)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		sysScript:TeamNotice(9000660294,7)
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		duplSystem:WinDupl();
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------