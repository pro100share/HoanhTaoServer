﻿--保存函数表
local npc_fun = LanternConfig:GetNpcScript()
--npcid
local npc_id = 10021121

-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------