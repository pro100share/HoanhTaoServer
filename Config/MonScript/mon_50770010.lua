--卧虎藏龙——许竹青（车轮战）
local dwMonsterId = 50770010
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 806020031,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	
	if (dwRand <=4000) then
		return 80602003,1
	end
	return 806020031,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local duplSystem = Player:GetSystem("CDuplSystem");
	Monster:Say(739)
	duplSystem:SetTollGateNum(10);	--设置第几个boss
	duplSystem:SetTollWin(true);	--设置副本状态为胜利
	--duplSystem:WinDupl();
	duplSystem.objCurDupl.m_WinFlag = true;
	duplSystem:WoHuCangLongLeave()
end
---------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js = self.GW_Js or 0
	
	if ((current/all) <= 1 and self.GW_Js == 0) then
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		Monster:Say(738)
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(737)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















