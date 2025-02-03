--单个npc对话:npc_10121014.lua
local npc_id=10121014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101411,},
  [2]={tp=tk.accept_check,id={11036,11037,11043,11044,11058},},
  [3]={tp=tk.complete_check,id={11035,11036,11042,11043,11057},},
  [4]={tp=tk.close,text=1,},
 },
--task 11035 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1103531,},
  [2]={tp=tk.complete_task,id=11035,text=1103532,},
 },
--task 11036 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1103621,},
  [2]={tp=tk.page,id=4,text=1103622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1103623,},
  [2]={tp=tk.accept_task,id=11036,text=1103624,},
 },
--task 11036 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1103631,},
  [2]={tp=tk.complete_task,id=11036,text=1103632,},
 },
--task 11037 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1103721,},
  [2]={tp=tk.page,id=7,text=1103722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1103723,},
  [2]={tp=tk.accept_task,id=11037,text=1103724,},
 },
--task 11042 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1104231,},
  [2]={tp=tk.complete_task,id=11042,text=1104232,},
 },
--task 11043 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1104321,},
  [2]={tp=tk.accept_task,id=11043,text=1104322,},
 },
--task 11043 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1104331,},
  [2]={tp=tk.complete_task,id=11043,text=1104332,},
 },
--task 11044 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=1104421,},
  [2]={tp=tk.accept_task,id=11044,text=1104422,},
 },
--task 11057 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=1105731,},
  [2]={tp=tk.complete_task,id=11057,text=1105732,},
 },
--task 11058 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=1105821,},
  [2]={tp=tk.page,id=14,text=1105822,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=1105823,},
  [2]={tp=tk.accept_task,id=11058,text=1105824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]