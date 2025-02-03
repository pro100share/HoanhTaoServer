--单个npc对话:npc_10021013.lua
local npc_id=10021013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101311,},
  [2]={tp=tk.accept_check,id={},},
  [3]={tp=tk.complete_check,id={4117},},
  [4]={tp=tk.amulet,text=12,},
  [8]={tp=tk.close,text=1,},
 },
--task 4117 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=411731,},
  [2]={tp=tk.complete_task,id=4117,text=411732,},
 },  
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]