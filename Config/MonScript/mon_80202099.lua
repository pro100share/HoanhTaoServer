local dwMonsterId = 80202099
local MonsterScript = {}
------盟主令
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

	local sysScript = Enemy:GetSystem("CScriptSystem")
	if not sysScript then
		return
	end

	local objWarSystem = Enemy:GetSystem("CWarSystem");
	if not objWarSystem then
		return
	end
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);

	if not objWar then
		return
	end
	local dwRoleID = Enemy:GetRoleID()
	if not dwRoleID then
		return
	end
	local Name = Enemy:GetName();
	
	local objCurMap = nil;
	local objMapSystem = Enemy:GetSystem("CMapSystem");

	if objMapSystem then
		objCurMap = objMapSystem:GetCurMap();
	end
	--objCurMap:BroadcastNotice(7,6001047033)	
	sysScript:Notice(6001047033,7);
	objWar:BroadcastWarNotice(1,5,6001047019,Name)
	--CScriptManager:Notice(SysStringConfigInfo[6001047018],6,false,dwMapId,15,25,SysStringConfigInfo[71])
	objWar:SetSplMember(dwRoleID)
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