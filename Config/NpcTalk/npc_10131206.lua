--单个npc对话:npc_10131206.lua
local npc_id=10131206
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013120611,}, 
  [2]={tp=tk.accept_check,id={12208},},
  [3]={tp=tk.complete_check,id={12208},},
  [4]={tp=tk.close,text=1,},
 }, 
--task 12208 accept_talk 
 [2]=
 {
  [1]={tp=tk.text,text=1220821,},
  [2]={tp=tk.accept_task,id=12208,text=1220822,},
 },
--task 12208 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1220831,},
  [2]={tp=tk.complete_task,id=12208,text=1220832,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 