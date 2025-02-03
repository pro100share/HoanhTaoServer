--单个npc对话:npc_10081008.lua
local npc_id=10081008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100811,},
  [2]={tp=tk.accept_check,id={8011,8012,8057,8058,8069},},
  [3]={tp=tk.complete_check,id={8010,8011,8056,8057,8068},},
  [4]={tp=tk.close,text=1,},
 },
--task 8010 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=801031,},
  [2]={tp=tk.complete_task,id=8010,text=801032,},
 },
--task 8011 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=801121,},
  [2]={tp=tk.page,id=4,text=801122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=801123,},
  [2]={tp=tk.accept_task,id=8011,text=801124,},
 },
--task 8011 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=801131,},
  [2]={tp=tk.complete_task,id=8011,text=801132,},
 },
--task 8012 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=801221,},
  [2]={tp=tk.page,id=7,text=801222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=801223,},
  [2]={tp=tk.accept_task,id=8012,text=801224,},
 },
--task 8056 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=805631,},
  [2]={tp=tk.complete_task,id=8056,text=805632,},
 },
--task 8057 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=805721,},
  [2]={tp=tk.page,id=10,text=805722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=805723,},
  [2]={tp=tk.accept_task,id=8057,text=805724,},
 },
--task 8057 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=805731,},
  [2]={tp=tk.complete_task,id=8057,text=805732,},
 },
--task 8058 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=805821,},
  [2]={tp=tk.page,id=13,text=805822,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=805823,},
  [2]={tp=tk.page,id=14,text=805824,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=805825,},
  [2]={tp=tk.accept_task,id=8058,text=805826,},
 },
--task 8068 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=806831,},
  [2]={tp=tk.complete_task,id=8068,text=806832,},
 },
--task 8069 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=806921,},
  [2]={tp=tk.page,id=17,text=806922,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=806923,},
  [2]={tp=tk.accept_task,id=8069,text=806924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]