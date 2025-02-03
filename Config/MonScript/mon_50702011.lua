local dwMonsterId = 50702011
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
		return 7007,1
	elseif (dwRand < 2000) then
		return 7004,1
	elseif (dwRand < 3000) then
		return 	7008,1
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
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	local yidong = 
	{
		{x=-38.85,y=40.99,dwSpeed=1};
		{x=-37.24,y=-28.52,dwSpeed=1};
		{x=-30.01,y=-35.86,dwSpeed=1};
		{x=-12.71,y=-38.09,dwSpeed=1};
		{x=-15.32,y=30.43,dwSpeed=1};
		{x=0.87,y=42.95,dwSpeed=1};
		{x=20.95,y=32.39,dwSpeed=1};
		{x=34.55,y=-26.45,dwSpeed=1};
	}
	Monster:MoveTo(yidong,true)
end
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		
	if not Monster:IsMoving() then
	
		local Pos = Monster:GetVectorPos()
		if (Pos.x-34.55)^2+(Pos.y+26.45)^2 < 2^2 then
			Monster:Remove()
			-- Map.lrxxx = (Map.lrxxx or 0) + 1
			-- if Map.lrxxx>4 then
				-- local Monster01 = mgrMonster:GetMonsterById(50702001)
				-- if #Monster01<1 then
					-- Map.lrxxx = 0
					-- Monster:MapNotice(234)
					-- mgrMonster:Add(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,2000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,4000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,6000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,8000)
					
				-- end
			-- end
			
		 end
	end
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
	local dwLevelm = Monster:GetLevel()        ----获得怪物等级
	
	-- Map.lrxxx = (Map.lrxxx or 0) + 1
	-- --if Map.lrxxx>4 then
		-- local Monster01 = mgrMonster:GetMonsterById(50702001)
		-- if #Monster01<1 and  Map.lrxxx>4 then
					-- Map.lrxxx = 0
					-- sysScript:TeamNotice(234)
					-- mgrMonster:Add(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,2000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,4000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,6000)
					-- mgrMonster:DelayAdd(50702001,(1000+dwLevelm),50702001,(21000+(math.floor((dwLevelm-2)/5)*5)),-40.75,49.73,dwObjId,8000)
					
				-- end
	--end
			

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------