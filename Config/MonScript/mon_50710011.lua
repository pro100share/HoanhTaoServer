local dwMonsterId = 50710011	--BOSS
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50710011,1
	end

	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 3500) then
		return 507100110,1
	else
		return 50710011,1
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
	
end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
		local Map = Monster:GetMap()						-----获取地图管理器
		local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
		local dwLevelm = Monster:GetLevel()        ----获得怪物等级
		--local p = Monster:GetBornPos()
		mgrMonster:DelayAdd(50710012,(3000+dwLevelm+2),50710002,(102000+(math.floor((dwLevelm+2)/5)*5)),500220010,3.3,2.47,dwObjId,20000)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------