﻿local dwMonsterId = 50760018
local MonsterScript = {}
------
--[[
--]]
---------------------------------------------
--获取当前要使用的技能id,技能等级
function MonsterScript:GetNextSkillId(Monster,Player)

end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
--死亡时执行
function MonsterScript:CBMonsterOnDead(Monster,Player)
	CWarHost:AddXiaKeList(dwMonsterId);
end
----------------------------------------------------------------------------
--杀死一个目标时执行
function MonsterScript:CBMonsterOnKill(Monster)
end
----------------------------------------------------------------------------
--受到攻击时执行
function MonsterScript:CBMonsterOnAttacked(Monster)

end
----------------------------------------------------------------------------
----------------------------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Monster,dwMonsterId,MonsterScript)
----------------------------------------------------------------------------




















