--单个npc对话:npc_10121201.lua
local npc_id=10121201
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012120111,},
  [2]={tp=tk.accept_check,id={11201,11202},},
  [3]={tp=tk.complete_check,id={11201,11202},},
  [6]={tp=tk.close,text=1,},
 },
--task 11201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1120121,},
  [2]={tp=tk.accept_task,id=11201,text=1120122,},
 },
--task 11201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1120131,},
  [2]={tp=tk.complete_task,id=11201,text=1120132,},
 },
--task 11202 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1120221,},
  [2]={tp=tk.accept_task,id=11202,text=1120222,},
 },
--task 11202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1120231,},
  [2]={tp=tk.complete_task,id=11202,text=1120232,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
 
  