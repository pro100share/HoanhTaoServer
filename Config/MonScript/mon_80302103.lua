local dwMonsterId = 80302103
local MonsterScript = {}
------武林宗师
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 7000,1
	end

	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	self.GW_Jn = self.GW_Jn or 0
	
	if ((current/all) <= 0.75  and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif ((current/all) <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	end


	local dwRand = math.random(10000);
	if (dwRand < 7500) then
		return 7000,1;
	else
		return 200020010;
	end
	
	
	return 7000,1

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