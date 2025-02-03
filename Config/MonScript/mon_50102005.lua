local dwMonsterId = 50102005
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
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	
	--大招
	local HP = MonsterDecision:life(Monster)
	if (HP <= 0.75 and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif (HP <= 0.5 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	elseif (HP <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002001,1
	end

	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 200020010
	end
	self.JiShu = self.JiShu + 1;
	--普通
	return 7000,1;
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
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	Monster:SetDuplData(4)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------