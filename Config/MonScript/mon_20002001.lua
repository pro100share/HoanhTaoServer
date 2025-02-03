local dwMonsterId = 20002001
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
	local HP = MonsterDecision:life(Monster)
	self.GW_Js = self.GW_Js or 0
	if (HP <= 0.75 and self.GW_Js == 0) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	elseif (HP <= 0.5 and HP >= 0.25 and self.GW_Js == 1) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	elseif (HP <= 0.25 and self.GW_Js == 2) then
		Monster:Say(50)
		self.GW_Js= self.GW_Js + 1
	end
end
--------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















