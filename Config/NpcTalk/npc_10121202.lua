--单个npc对话:npc_10121202.lua
local npc_id=10121202
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012120211,},
  [2]={tp=tk.accept_check,id={11203,11204},},
  [3]={tp=tk.complete_check,id={11203,11204},},
  [6]={tp=tk.close,text=1,},
   },
--task 11203 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1120321,},
  [2]={tp=tk.accept_task,id=11203,text=1120322,},
 },
--task 11203 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1120331,},
  [2]={tp=tk.complete_task,id=11203,text=1120332,},
 },
--task 11204 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1120421,},
  [2]={tp=tk.accept_task,id=11204,text=1120422,},
 },
--task 11202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1120431,},
  [2]={tp=tk.complete_task,id=11204,text=1120432,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
