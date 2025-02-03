--单个npc对话:npc_80251001.lua
local npc_id=80251001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100111,},
  [2]={tp=tk.accept_check,id={},},
  [3]={tp=tk.complete_check,id={},},
  [4]={tp=tk.close,text=1,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]