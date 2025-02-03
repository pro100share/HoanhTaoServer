local dwMonsterId = 50702012
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
		return 7005,1
	elseif (dwRand < 2000) then
		return 7007,1
	elseif (dwRand < 2200) then
		return 	7003,1
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
		{x=-42.37,y=41.76,dwSpeed=1};
		{x=-40.43,y=-30.82,dwSpeed=1};
		{x=-30.73,y=-39.36,dwSpeed=1};
		{x=-9.09,y=-40.55,dwSpeed=1};
		{x=-10.27,y=27.10,dwSpeed=1};
		{x=-0.30,y=37.89,dwSpeed=1};
		{x=16.65,y=29.87,dwSpeed=1};
		{x=29.99,y=-27.97,dwSpeed=1};
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
		if (Pos.x-29.99)^2+(Pos.y+27.97)^2 < 2^2 then
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