--单个npc对话:npc_10131203.lua
local npc_id=10131203
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013120311,}, 
  [2]={tp=tk.accept_check,id={12203,12204,12205},},
  [3]={tp=tk.complete_check,id={12203,12204,12205},},
  [4]={tp=tk.close,text=1,},
 }, 
--task 12203 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1220321,},
  [2]={tp=tk.accept_task,id=12203,text=1220322,},
 },
--task 12203 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1220331,},
  [2]={tp=tk.complete_task,id=12203,text=1220332,},
 },
--task 12204 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1220421,},
  [2]={tp=tk.accept_task,id=12204,text=1220422,},
 },
--task 12204 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1220431,},
  [2]={tp=tk.complete_task,id=12204,text=1220432,},
 },
--task 12205 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1220521,},
  [2]={tp=tk.accept_task,id=12205,text=1220522,},
 },
--task 12205 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1220531,},
  [2]={tp=tk.complete_task,id=12205,text=1220532,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 