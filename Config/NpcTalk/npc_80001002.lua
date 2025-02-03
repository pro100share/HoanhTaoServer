--单个npc对话:npc_80011002.lua
local npc_id=80001002
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=5060100111,},
	[2]={tp=tk.fun,sort=1,fun="ChuanSong",param={},text=93,},
	
	
	
	--[6]={tp=tk.war_over,id=10030,text=88},
  },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 