local dwMonsterId = 50062002
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
	--沉默后普通攻击
	if not MonsterSilent(Monster) then
		return 10012004,1
	end
	local dwRand = MonsterDecision:odds(Monster,true)
	if (dwRand < 8000) then
		return 10012004,1
	else
		return 100120040,1
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
		Map.lr500605 = (Map.lr500605 or 0) + 1
		if Map.lr500605<2 then
			Monster:Say(404)
			
			local fnFunction = function(sysScript)
				sysScript:Story(5001002)
			end
			CScriptManager:DoFunction(Monster,fnFunction)
			
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,14.06,5.24)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,11.11,8.31)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,8.58,10.48)
			
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-10.15,-15.77)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-11.81,-13.81)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-13.76,-11.36)
			
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,14.01,-10.87)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,10.78,-13.76)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,6.84,-17.10)
			
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-7.62,9.92)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-10.58,6.95)
			mgrMonster:Add(50062004,50062004,50062004,100045,100920040,-13.69,3.64)
		end
	end
 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
