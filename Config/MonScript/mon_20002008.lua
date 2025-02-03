local dwMonsterId = 20002008
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

	self.GW_Jn = self.GW_Jn or 0
	--大招
	local HP = MonsterDecision:life(Monster)
	if (HP <= 0.75 and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(56)
		return 200020081,1
	elseif (HP <= 0.5 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(56)
		return 200020081,1
	elseif (HP <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		Monster:Say(56)
		return 200020081,1
	end

	local dwRand = math.random(10000);
	if (dwRand <= 1000) then
		return 200020080,1
	elseif (dwRand <= 3000) then
		return 200020082,1
	elseif (dwRand <= 4000) then
		return 200020083,1
	end
	return 20002008,1
end
---------------------------------------------
function MonsterScript:GetNextBronTime(dwLine,dwMap,dwYear,dwMonth,dwDay,dwWeek,dwHour,dwMin,dwSec)

end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local GName = Monster:GetName()
	local RName = Player:GetName()
	CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])
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






















