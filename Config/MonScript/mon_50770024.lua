--卧虎藏龙——秦江（大乱斗）
local dwMonsterId = 50770024
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	if not MonsterSilent(Monster) then
		return 50770009,1
	end

	local dwRand = math.random(10000);
	if dwRand <= 1500 then
		return 507700090,1
	elseif dwRand <= 3500 then
		return 507700091,1
	end

	--普通
	return 50770009,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	local Map = Monster:GetMap()						-----获取地图管理器
	
	Map.whcl = (Map.whcl or 0) + 1
	Monster:Say(736)
	if Map.whcl == 12 then
		local duplSystem = Player:GetSystem("CDuplSystem");
		-- duplSystem:WinDupl();
		duplSystem.objCurDupl.m_WinFlag = true;
		duplSystem:WoHuCangLongLeave()
	end
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
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem");
		Monster:Say(735)
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(734)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















