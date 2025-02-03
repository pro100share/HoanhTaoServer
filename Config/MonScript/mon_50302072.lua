﻿local dwMonsterId = 50302072	--李莫愁
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302072,1
	end
	local dwRand = math.random(10000)
	if (dwRand > 6500) then
		return 503020720,1
	end
	return 50302072,1
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
	local ZhenlongChessSys = objPlayer:GetSystem("CZhenlongChessSystem")
	local ScriptSys = objPlayer:GetSystem("CScriptSystem")
	local _ , Fight = ZhenlongChessSys:GetZhenlongInfo()
	local FightStar = {
		{550000,5},
		{580000,4},
		{600000,3},
		{9999999999,2},
	};
	for i = 1 , #FightStar do
		if Fight < FightStar[i][1] then
			if ZhenlongChessSys:GetBossStarLevel(dwMonsterId) < FightStar[i][2] then
				ZhenlongChessSys:SetBossStarLevel(dwMonsterId, FightStar[i][2])
			end
		end
	end
	ZhenlongChessSys:SetProcess(73)
	ScriptSys:AddSpItem(1,5000)
	ScriptSys:AddSpItem(3,10000)
	-- MonsterDecision:FightNum(Monster,dwMonsterId,objPlayer)
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
	
	if ((current/all) <= 0.25 and self.GW_Js == 0) then
		local sysMonsterBuff = Monster:GetSystem("CMonsterBuffSystem")
		sysMonsterBuff:AddBuff(50600011,1,Monster)
		self.GW_Js= self.GW_Js + 1
	end
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















