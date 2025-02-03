--卧虎藏龙——欧雅琪（车轮战）
local dwMonsterId = 50770008
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	if not MonsterSilent(Monster) then
		return 60011009,1
	end

	local dwRand = math.random(10000);
	if (dwRand <= 3500) then
		return 600110090,1
	elseif (dwRand> 3500 and dwRand <= 8500) then
		return 600110091,1
	end
	--普通
	return 60011009,1;
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	-- local Map = Monster:GetMap()				----获取所在地图
	-- local mgrMonster = Map:GetMonsterMgr()		----获得怪物管理器
	Monster:Say(733)
	local duplSystem = objPlayer:GetSystem("CDuplSystem");	--获得副本系统
	duplSystem:SetTollGateNum(8);	--设置第几个boss
	duplSystem:SetTollWin(true);	--设置副本状态为胜利
	duplSystem:OnBossDeadCheck();	--弹出结算界面
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
		Monster:Say(732)
		sysMonsterBuff:AddBuff(DuplAddition[6001].DateInfo.MonBuff[6005],1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	Monster:Say(731)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















