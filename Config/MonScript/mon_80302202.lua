local dwMonsterId = 80302202
local MonsterScript = {}
------白虎
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand >= 7000) then
		return 90000
	end
	return 900000,1
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	MonsterDecision:Yell(Monster,300,30)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Enemy)
	local objWarSystem = Enemy:GetSystem("CWarSystem");
	local objWar = CWarHost:FindWar(objWarSystem.dwCurWarID);
	local JiFen = WarAddition[10040].Base.Mark[dwMonsterId]
	objWar:SetWarTeamScore(Enemy,JiFen)
	local szName = Enemy:GetName()
	local Name = Monster:GetName()
	CScriptManager:Notice(string.format(SysStringConfigInfo[13009000015],szName,Name,JiFen),6,false,8030,15)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
		local Data = {
		{"dwHPMax",10};
		{"dwAttack",4};
	};
	MonsterDecision:Ambush(Monster,Data)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------