--单个npc对话:npc_90010101.lua
local npc_id=90010101
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=9001010111,},
  [2]={tp=tk.escort,text=9001010112,},
  [3]={tp=tk.close,text=1,},
 },
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
-------------------------------------------------------
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 