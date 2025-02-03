--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021096
----------------------------------------------
local mon_id = nil
-----------------------------------
--npc触发对话时执行（修改对话内容）
function npc_fun.zkn(objNpc,objPlayer,sysNpc,tbParam,sysScript)

	if mon_id then
		sysScript:DelMonObj(mon_id)
	end
	
	mon_id = sysScript:AddMonSP(10022001,1001,10022001,-1,10090,-55.72,32.44)
		
		

end
-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------
