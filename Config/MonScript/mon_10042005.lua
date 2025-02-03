local dwMonsterId = 10042005
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 10042005,1
	end
	local dwRand = math.random(10000);
	if (dwRand < 7500) then
		return 10042005,1
	elseif (dwRand > 2500) then
		return 100420050,1
	end
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)
	self.xxx = self.xxx
	if self.xxx then return end;
	local Info = {
		year = dwYear;		--年
		month = dwMonth;		--月
		day = dwDay;			--日
		hour = dwHour;		--时
		min = dwMin;			--分
		sec = dwSec;			--秒
	}
	Info.sec = Info.sec + 2
	self.xxx = true
	return Info,Pos;
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
		local Map = Monster:GetMap()						-----获取地图管理器
		local mgrNpc = Map:GetNpcMgr()				----获得NPC管理器
		mgrNpc:Story(140)	
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















