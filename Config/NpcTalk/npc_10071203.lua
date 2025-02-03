--单个npc对话:npc_10071203.lua
local npc_id=10071203
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007120311,},
  [2]={tp=tk.accept_check,id={6202,6203},},
  [3]={tp=tk.complete_check,id={6202,6203},},
  [8]={tp=tk.close,text=1,},
 },
--task 6202 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=620221,},
  [2]={tp=tk.accept_task,id=6202,text=620222,},
 },
--task 6202 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=620231,},
  [2]={tp=tk.complete_task,id=6202,text=620232,},
 },
--task 6203 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=620321,},
  [2]={tp=tk.accept_task,id=6203,text=620322,},
 },
--task 6203 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=620331,},
  [2]={tp=tk.complete_task,id=6203,text=620332,},
 }, 

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 