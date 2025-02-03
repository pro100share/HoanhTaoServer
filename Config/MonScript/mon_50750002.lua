local dwMonsterId = 50750002
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	if not MonsterSilent(Monster) then
		return 50750001,1
	end
	
	local dwRand = math.random(10000);
	if (dwRand <= 1500) then
		return 507500010,1
	end
	--普通
	return 50750001,1;
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	-- local GName = Monster:GetName()
	-- local RName = Player:GetName()

	-- --CScriptManager:Notice(string.format(SysStringConfigInfo[57],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
	-- --Monster:MapNotice(9000660820,7)
	
	-- local stateSystem = Player:GetSystem("CStateSystem");
	-- if not stateSystem then	
		-- _err("CStateSystem is nil when ExitDuplLifeOver");
		-- return;
	-- end;
	-- --如果玩家已经死了 怪物死的时候不判断副本胜利
	-- if stateSystem.dwCurState == enPlayerState.ePS_Dead then
		-- return
	-- end;
	
	-- local duplSystem = Player:GetSystem("CDuplSystem");
	-- duplSystem:WinDupl();
	
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
	
	if ((current/all) <= 1 and self.GW_Js == 0) then
		--Monster:Say(1003210000)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		--Monster:Say(1003210000)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(50700026)		
		--Monster:Say(1003210001)
		self.GW_Js= self.GW_Js + 1
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















