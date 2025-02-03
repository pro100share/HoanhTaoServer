--单个npc对话:npc_50201002.lua
local npc_id=50201002
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=5020100201,},
	[2]={tp=tk.fun,sort=1,fun="zkn",param={},text=5020100102,},
 
	--[4]={tp=tk.shop,id=10000,text=7,},
 },
--task 2116 complete_talk
 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]