--无色禅师
local dwMonsterId = 10112016
local MonsterScript = {}
------
--[[
--]]
-- local n = 0
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 10112016,1
	end
	
	-- --大招
	-- self.GW_Jn = self.GW_Jn or 0
	-- local HP = MonsterDecision:life(Monster)
	-- if (HP <= 0.75 and self.GW_Jn == 0) then
		-- self.GW_Jn= self.GW_Jn + 1
		-- return 101120162,1
	-- elseif (HP <= 0.5 and self.GW_Jn == 1) then
		-- self.GW_Jn= self.GW_Jn + 1
		-- return 101120162,1
	-- elseif (HP <= 0.25 and self.GW_Jn == 2) then
		-- self.GW_Jn= self.GW_Jn + 1
		-- return 101120162,1
	-- end
	
	local dwRand = math.random(10000)
	if (dwRand <=4000) then
		return 101120160,1		--单体连环踢
	end
	
	
	return 10112016,1
	
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
	-- local GName = Monster:GetName()
	-- local RName = objPlayer:GetName()
	-- CScriptManager:Notice(string.format(SysStringConfigInfo[54],RName,GName).."%s",6,false,dwMapId,15,17,SysStringConfigInfo[55])	
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer)
	
end
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)

end
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)

end

----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------