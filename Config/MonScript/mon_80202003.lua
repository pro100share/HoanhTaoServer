local dwMonsterId = 80202003
local MonsterScript = {}
------经验怪物
--[[
--]]
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
	local Level = Monster:GetLevel()
	local Multiple = 0
	if (Level >= 35) then
		Multiple = 3;
	elseif (Level >= 50) then
		Multiple = 6;
	elseif (Level >= 60) then
		Multiple = 9;
	elseif (Level >= 70) then
		Multiple = 12;
	end
	--当前经验
	local Exp = Monster:GetExp()
	--设置怪物经验
	Monster:SetExp((Exp*Multiple))
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)

end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
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