local dwMonsterId = 50112001
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302007,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 50302007,1
	else
		return 503020070,1
	end
end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
	
end
--受到攻击时执行
 function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)
 	local Map = Monster:GetMap()						-----获取地图管理器
	local mgrMonster = Map:GetMonsterMgr()				-----获取怪物管理器
	
	local current = Monster:GetHP()	--获取当前血量
	local all = Monster:GetMaxHP()		--获取全部血量
	
	if current <= 0 then return end
	if  current/all < 0.5 then
		Map.lr501104 = (Map.lr501104 or 0) + 1
		if Map.lr501104<2 then
		Monster:Say(406)
			mgrMonster:Add(50112003,50112003,50112003,100060,81020,25.62,21.36)
			mgrMonster:Add(50112003,50112003,50112003,100060,81020,24.32,23.29)
			mgrMonster:Add(50112003,50112003,50112003,100060,81020,22.52,24.90)
		end
	end
 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
