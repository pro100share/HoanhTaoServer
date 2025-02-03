﻿local dwMonsterId = 80202001
local MonsterScript = {}
------掉落怪物
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
function MonsterScript:CBMonsterOnKill(Monster,Enemy)
	local objWarSystem = Enemy:GetSystem("CWarSystem");
	if not objWarSystem then
		return
	end
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);

	if not objWar then
		return
	end
	
	local dwRoleID = Enemy:GetRoleID()
	local number = objWar:IsSplMember(dwRoleID)
	if (number) then
		objWar:RmvSplMember(dwRoleID)
	end
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------