--单个npc对话:npc_10021048.lua
local npc_id=10021048

local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=98},
	[2]={tp=tk.task_fun,id=58,text=97,},
 },
}



CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)

--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]