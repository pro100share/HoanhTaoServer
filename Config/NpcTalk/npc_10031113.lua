--单个npc对话:npc_10031113.lua
local npc_id=10031113
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=1003111301,},
	[2]={tp=tk.close,text=1,},
	--[2]={tp=tk.fun,sort=1,fun="caidan100301",param={},text=1003111302,},
 
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