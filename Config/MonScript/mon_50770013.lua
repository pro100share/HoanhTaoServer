﻿--卧虎藏龙——大象（大乱斗）
local dwMonsterId = 50770013
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)
end
---------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,objPlayer,sysScript)
end
---------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
---------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)
end
---------------------------------------------
--出生前执行
function MonsterScript:CBMonsterBeforeBorn(Monster)
end
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------






















