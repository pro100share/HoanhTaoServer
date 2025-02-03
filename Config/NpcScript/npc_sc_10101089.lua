--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10101089

--[[
	功能：
	动态修改npc对话
	并通过npc对话刷怪
--]]

--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	if sysScript[npc_id] then return end;
	if sysScript:GetTaskState(9065) == TaskStateConfig.Accept then
		local Link = {tp=tk.page,id=2,text=1010108912,}
		sysScript:NpcModiTalkLink(talk_page,1,2,Link)
	end
end

----------------------------------------------
function npc_fun.shaguai(objNpc,objPlayer,sysNpc,tbParam,sysScript)
	sysScript:KillMonster(88888853)
end












-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------