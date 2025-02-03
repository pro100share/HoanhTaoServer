local dwMonsterId = 50710008	--BOSS
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
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		local Map = Monster:GetMap()						-----获取地图管理器
		--local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
		--local dwLevelp = objPlayer:GetLevel() ---获得玩家等级
		--local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		Map.lrxxx = (Map.lrxxx or 0) + 1
		if Map.lrxxx>124 then
		Map.lrxxx = 0
		-- local Monster1  = mgrMonster:GetMonsterById(50710001)	--获得活着的怪物ID
		-- local Monster2  = mgrMonster:GetMonsterById(50710002)	--获得活着的怪物ID
		-- local Monster3  = mgrMonster:GetMonsterById(50710003)	--获得活着的怪物ID
		-- local Monster4  = mgrMonster:GetMonsterById(50710004)	--获得活着的怪物ID
		-- local Monster5  = mgrMonster:GetMonsterById(50710005)	--获得活着的怪物ID
		-- local Monster6  = mgrMonster:GetMonsterById(50710006)	--获得活着的怪物ID
		-- local Monster7  = mgrMonster:GetMonsterById(50710007)	--获得活着的怪物ID
		-- local Monster8  = mgrMonster:GetMonsterById(50710008)	--获得活着的怪物ID
		-- local Monster9  = mgrMonster:GetMonsterById(50710009)	--获得活着的怪物ID
		-- local Monster10 = mgrMonster:GetMonsterById(50710010)	--获得活着的怪物ID
		
		-- if #Monster1<1 and
			-- #Monster2<1 and
			-- #Monster3<1 and
			-- #Monster4<1 and
			-- #Monster5<1 and
			-- #Monster6<1 and
			-- #Monster7<1 and
			-- #Monster8<1 and
			-- #Monster9<1 and
			-- #Monster10<1 then
			
			local duplSystem = objPlayer:GetSystem("CDuplSystem");
		    duplSystem:WinDupl();
			
		
		end
end
-- --死亡时执行
-- function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		-- local Map = Monster:GetMap()						-----获取地图管理器
		-- local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
		-- local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		-- local p = Monster:GetBornPos()
		-- mgrMonster:DelayAdd(50710009,(1000+dwLevelm+2),50710001,(5060000+(math.floor((dwLevelm+2)/5)*5)),p.x,p.y,dwObjId,15000)
-- end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------