--单个npc对话:npc_10061202.lua
local npc_id=10061202
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006120211,},
  [2]={tp=tk.accept_check,id={5205},},
  [3]={tp=tk.complete_check,id={5205},},
  [8]={tp=tk.close,text=1,},
 },
--task 5205 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=520521,},
  [2]={tp=tk.accept_task,id=5205,text=520522,},
 },
--task 5205 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=520531,},
  [2]={tp=tk.complete_task,id=5205,text=520532,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 