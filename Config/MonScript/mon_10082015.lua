local dwMonsterId = 10082015
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

end
---------------------------------------------
--怪物出生时执行
function MonsterScript:CBMonsterOnBorn(Monster)
			-- local fnFunction = function(sysScript)
				-- sysScript:Story(805301)
			-- end
			-- CScriptManager:DoFunction(Monster,fnFunction)			
end
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
	
end
--受到攻击时执行
 function MonsterScript:CBMonsterOnAttacked(Monster,objPlayer,dwSkillId)

 end
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster, objKiller)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------
