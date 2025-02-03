--单个npc对话:npc_10121203.lua
local npc_id=10121203
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012120311,},
  [2]={tp=tk.accept_check,id={11205,11206},},
  [3]={tp=tk.complete_check,id={11205,11206},},
  [6]={tp=tk.close,text=1,},
   },
--task 11205 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1120521,},
  [2]={tp=tk.accept_task,id=11205,text=1120522,},
 },
--task 11205 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1120531,},
  [2]={tp=tk.complete_task,id=11205,text=1120532,},
 },
--task 11206 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1120621,},
  [2]={tp=tk.accept_task,id=11206,text=1120622,},
 },
--task 11206complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1120631,},
  [2]={tp=tk.complete_task,id=11206,text=1120632,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]