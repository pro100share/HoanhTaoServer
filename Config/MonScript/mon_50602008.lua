local dwMonsterId = 50602008	--BOSS
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
	if (dwRand < 8000) then
		return 7000,1
	else
		return 50602008,1
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
		-- local Map = Monster:GetMap()						-----获取地图管理器
		-- local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		-- mgrNpc:Story(103)
		-- local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器	
		-- local Monster1 = mgrMonster:GetMonsterById(50302005)	--获得活着的怪物ID
		-- for k,v in pairs(Monster1) do
			 -- local MapId,x,y = v:GetPos()
			-- mgrMonster:Remove(v:GetRoleID())
			-- mgrMonster:Add(50302006,50302006,50302006,50302006,x,y)
		-- end		
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		sysScript:TeamNotice(9000660190,7)
		local duplSystem = objPlayer:GetSystem("CDuplSystem");
		duplSystem:WinDupl();
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------