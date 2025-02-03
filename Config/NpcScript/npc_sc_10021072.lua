--保存函数表
local npc_fun = {}
--npcid
local npc_id = 10021072

--[[
	功能：
	动态修改npc对话
	并通过npc对话刷怪
--]]

--npc触发对话时执行（修改对话内容）
function npc_fun.cb_npc_on_talk(talk_page,objPlayer,sysScript)
	local sysTask = objPlayer:GetSystem("CTaskSystem")
	local Task = sysTask.Tasks[20102]
	if not Task then return end;
	if Task.Record.dwCompleteTimes > 0 then
		local Link = {tp=tk.close,text=1002107212,}
		sysScript:NpcModiTalkLink(talk_page,1,8,Link)
	end
end

--刷怪
function npc_fun.mon_born(objNpc,objPlayer,sysNpc,tbParam,sysScript)


end












-----------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Npc,npc_id,npc_fun)
-----------------------------------------------