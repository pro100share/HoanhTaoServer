local dwMonsterId = 50750001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50750001,1
	end
	
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	if current <= 0 then 
		return 
	end
	
	self.GW_Js1 = self.GW_Js1 or 0

	if ((current/all) <= 0.9  and self.GW_Js1 == 0) then
			self.GW_Js1= self.GW_Js1 + 1;
		return 507500010,1	
	elseif ((current/all) <= 0.8  and self.GW_Js1 == 1)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.7  and self.GW_Js1 == 2)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.6  and self.GW_Js1 == 3)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.5  and self.GW_Js1 == 4)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.4  and self.GW_Js1 == 5)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.3  and self.GW_Js1 == 6)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.2  and self.GW_Js1 == 7)  then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	elseif ((current/all) <= 0.1 and self.GW_Js == 8) then
			self.GW_Js1= self.GW_Js1 + 1
		return 507500010,1
	end
	
	return 50750001,1;
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	-- local GName = Monster:GetName()
	-- local RName = Player:GetName()

	-- CScriptManager:Notice(string.format(SysStringConfigInfo[57],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
	-- Monster:MapNotice(9000660820,7)
	
	-- local stateSystem = Player:GetSystem("CStateSystem");
	-- if not stateSystem then	
		-- _err("CStateSystem is nil when ExitDuplLifeOver");
		-- return;
	-- end;
	--如果玩家已经死了 怪物死的时候不判断副本胜利
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
	local i = math.random( 1003210048,1003210050 );
	
	if ( (current/all) <= 0.9 )  and (self.GW_Js == 0) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
		print( "self.GW_Js=============",self.GW_Js )
	elseif ((current/all) < 0.8 and (current/all) >= 0.7 and self.GW_Js == 1) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.7 and (current/all) >= 0.6 and self.GW_Js == 2) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.6 and (current/all) >= 0.5 and self.GW_Js == 3) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.5 and (current/all) >= 0.4 and self.GW_Js == 4) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.4 and (current/all) >= 0.3 and self.GW_Js == 5) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.3 and (current/all) >= 0.2 and self.GW_Js == 6) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) < 0.2 and (current/all) >= 0.1 and self.GW_Js == 7) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.1 and self.GW_Js == 8) then
		Monster:Say(i)
		self.GW_Js= self.GW_Js + 1
	end
end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















