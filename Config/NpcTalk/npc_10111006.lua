--单个npc对话:npc_10111006.lua
local npc_id=10111006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100611,},
  [2]={tp=tk.accept_check,id={10012,10013,10014,10044},},
  [3]={tp=tk.complete_check,id={10011,10012,10013,10043},},
  [8]={tp=tk.close,text=1,},
 },
--task 10011 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1001131,},
  [2]={tp=tk.complete_task,id=10011,text=1001132,},
 },
--task 10012 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1001221,},
  [2]={tp=tk.accept_task,id=10012,text=1001222,},
 },
--task 10012 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=1001231,},
  [2]={tp=tk.complete_task,id=10012,text=1001232,},
 },
--task 10013 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=1001321,},
  [2]={tp=tk.page,id=6,text=1001322,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=1001323,},
  [2]={tp=tk.accept_task,id=10013,text=1001324,},
 },
--task 10013 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1001331,},
  [2]={tp=tk.complete_task,id=10013,text=1001332,},
 },
--task 10014 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1001421,},
  [2]={tp=tk.page,id=9,text=1001422,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1001423,},
  [2]={tp=tk.page,id=10,text=1001424,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1001425,},
  [2]={tp=tk.accept_task,id=10014,text=1001426,},
 },
--task 10043 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1004331,},
  [2]={tp=tk.complete_task,id=10043,text=1004332,},
 },
--task 10044 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1004421,},
  [2]={tp=tk.page,id=13,text=1004422,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1004423,},
  [2]={tp=tk.accept_task,id=10044,text=1004424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]