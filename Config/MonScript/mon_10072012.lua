local dwMonsterId = 10072012
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 806020051,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand <=4000) then
		return 80602005,1
	end
	return 806020051,1
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
	 local current = Monster:GetHP()	--获取当前血量
	 local all = Monster:GetMaxHP()		--获取全部血量
	 if current <= 0 then return end
	 if  current/all < 0.99 then
		 Monster:Say(603441)
	end
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















