--保存函数表
local npc_fun = {}
--npcid
local npc_id = 50051001

function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	objPlayer:GetSystem("CZhenlongChessSystem"):ClientOpenUI();
end

-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
