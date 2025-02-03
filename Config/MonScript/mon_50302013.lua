﻿local dwMonsterId = 50302013	--黛绮丝
local MonsterScript = {}
local now = 0
-- local dwHurt = 0
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302013,1
	end
	local dwRand = math.random(10000)
	if (dwRand > 6500) then
		return 503020130,1
	end
	return 50302013,1
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objEnemy,dwSkillID,dwHurtValue)
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
	
	-- if dwHurtValue > dwHurt then
		-- dwHurt = dwHurtValue
	-- end
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
	now = _now()
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer)
	local later = _now()
	local losttime = later - now
	local ZhenlongChessSys = objPlayer:GetSystem("CZhenlongChessSystem")
	local ScriptSys = objPlayer:GetSystem("CScriptSystem")
	ZhenlongChessBossList:CalcStarLevel(dwMonsterId, losttime, killCount, remainCount, fightSource, HP, dwHurt, ZhenlongChessSys)
	ZhenlongChessSys:RecordCount(dwMonsterId)
	ZhenlongChessSys:SetProcess(14)
	ScriptSys:AddSpItem(1,200)
	ScriptSys:AddSpItem(3,5000)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------