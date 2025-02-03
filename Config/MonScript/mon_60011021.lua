local dwMonsterId = 60011021
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 20002005,1
	end
	self.JiShu = self.JiShu or 0
	self.GW_Jn = self.GW_Jn or 0
	
	--大招
	local HP = MonsterDecision:life(Monster)
	if (HP <= 0.75 and self.GW_Jn == 0) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002006,1
	elseif (HP <= 0.5 and self.GW_Jn == 1) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002006,1
	elseif (HP <= 0.25 and self.GW_Jn == 2) then
		self.GW_Jn= self.GW_Jn + 1
		return 20002006,1
	end
	
	local whether = MonsterDecision:factor(self.JiShu)
	if (whether) then
		self.JiShu = 0;
		return 200020060
	end
	
	
	local dwRand = math.random(10000);
	if (dwRand <= 2000) then
		return 200020061,1
	end
	self.JiShu = self.JiShu + 1;
	--普通
	return 20002005,1;
end
----------------------------------------------------------------------------
--出生前执行
--function MonsterScript:CBMonsterBeforeBorn(Monster)
--	local Data = {
--		{"dwHPMax",1.6};
--		{"dwAttack",1.6};
--		{"dwDefense",1.6};
--	};
--	MonsterDecision:Ambush(Monster,Data)
--end
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local GName = Monster:GetName()
	local RName = Player:GetName()
	CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
	
	local stateSystem = Player:GetSystem("CStateSystem");
	if not stateSystem then	
		_err("CStateSystem is nil when ExitDuplLifeOver");
		return;
	end;
	--如果玩家已经死了 怪物死的时候不判断副本胜利
	if stateSystem.dwCurState == enPlayerState.ePS_Dead then
		return
	end;
	
	local duplSystem = Player:GetSystem("CDuplSystem");
	duplSystem:WinDupl();
end
----------------------------------------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
----------------------------------------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js = self.GW_Js or 0
	
	if ((current/all) <= 0.75 and self.GW_Js == 0) then
		Monster:Say(54)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		Monster:Say(54)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		Monster:Say(54)
		self.GW_Js= self.GW_Js + 1
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















