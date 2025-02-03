--单个npc对话:npc_10011001.lua
local npc_id=80011001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8001100111,},
  [4]={tp=tk.shop,id=10000,text=7,},
  [8]={tp=tk.close,text=1,},
  },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 