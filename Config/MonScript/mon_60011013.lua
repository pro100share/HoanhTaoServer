local dwMonsterId = 60011013
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	local current = Monster:GetHP()		--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	
	if not MonsterSilent(Monster) then
		return 60011013,1
	end
	
	if (current/all) == 0.70 then
		return 600110130,1
	elseif (current/all) == 0.30 then
		return 600110130,1
	end

	local dwRand = math.random(10000);
	if (dwRand <= 1500) then
		return 600110130,1
	elseif (dwRand <= 6000) then
		return 600110131,1
	end
	--普通
	return 60011013,1;
end
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local GName = Monster:GetName()
	local RName = Player:GetName()
	-- CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
	
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
		Monster:Say(1003210024)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.5 and (current/all) >= 0.25 and self.GW_Js == 1) then
		Monster:Say(1003210024)
		self.GW_Js= self.GW_Js + 1
	elseif ((current/all) <= 0.25 and self.GW_Js == 2) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)	
		Monster:Say(1003210025)
		self.GW_Js= self.GW_Js + 1
	end
end

----------------------------------------------------------------------------
--每秒执行
function MonsterScript:CBMonsterOnUpdate(Monster)
	local Map = Monster:GetMap();						-----获取地图管理器
	local player = Map:GetAllPlayer();					-----获取地图玩家管理器
	for i,v in pairs(player) do
		local sysScript = v:GetSystem("CScriptSystem");
		local MapID,Selfx,Selfy = sysScript:GetMapPos();
		local MonsterSys = Monster:GetSystem("CMonsterMoveSystem");
		local Targetpos = MonsterSys:GetVPos();
		if sysScript:CheckBUff(50600021) then
			if (Selfx-Targetpos.x)^2 + (Selfy-Targetpos.y)^2 < 5^2 then
				if not sysScript:CheckBUff(50600022) then
					sysScript:AddBuff(50600022)
				end
				if not sysScript:CheckBUff(50600023) then
					sysScript:AddBuff(50600023,1,Monster)
				end
			else
				if sysScript:CheckBUff(50600022) then
					sysScript:DelBuff(50600022)
				end
				if sysScript:CheckBUff(50600023) then
					sysScript:DelBuff(50600023)
				end
			end
		else
			if sysScript:CheckBUff(50600022) then
				sysScript:DelBuff(50600022)
			end
			if sysScript:CheckBUff(50600023) then
				sysScript:DelBuff(50600023)
			end
		end
	end
end
----------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















