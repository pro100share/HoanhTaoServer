local dwMonsterId = 50112002
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 50302023,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 7500) then
		return 50302023,1
	else
		return 503020230,1
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
		Map.lr501105 = (Map.lr501105 or 0) + 1
		if Map.lr501105<2 then
			Monster:Say(404)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,5.43,-2.87)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,0.26,-8.27)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,-1.48,3.53)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,-6.58,-0.95)
			
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,4.75,3.42)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,6.89,-9.17)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,-7.05,4.64)
			mgrMonster:Add(50112004,50112004,50112004,100060,100920040,-5.94,-8.33)
		end
	end
 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
