--单个npc对话:npc_10081002.lua
local npc_id=10081002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100211,},
  [2]={tp=tk.accept_check,id={8019,8020,8021,8029,8031,8033,8037,8042,8063,8072},},
  [3]={tp=tk.complete_check,id={8018,8019,8020,8028,8030,8032,8036,8041,8062,8071},},
  [4]={tp=tk.close,text=1,},
 },
--task 8018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=801831,},
  [2]={tp=tk.complete_task,id=8018,text=801832,},
 },
--task 8019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=801921,},
  [2]={tp=tk.page,id=4,text=801922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=801923,},
  [2]={tp=tk.accept_task,id=8019,text=801924,},
 },
--task 8019 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=801931,},
  [2]={tp=tk.complete_task,id=8019,text=801932,},
 },
--task 8020 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=802021,},
  [2]={tp=tk.page,id=7,text=802022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=802023,},
  [2]={tp=tk.accept_task,id=8020,text=802024,},
 },
--task 8020 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=802031,},
  [2]={tp=tk.complete_task,id=8020,text=802032,},
 },
--task 8021 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=802121,},
  [2]={tp=tk.page,id=10,text=802122,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=802123,},
  [2]={tp=tk.accept_task,id=8021,text=802124,},
 },
--task 8028 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=802831,},
  [2]={tp=tk.complete_task,id=8028,text=802832,},
 },
--task 8029 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=802921,},
  [2]={tp=tk.page,id=13,text=802922,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=802923,},
  [2]={tp=tk.accept_task,id=8029,text=802924,},
 },
--task 8030 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=803031,},
  [2]={tp=tk.complete_task,id=8030,text=803032,},
 },
--task 8031 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=803121,},
  [2]={tp=tk.page,id=16,text=803122,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=803123,},
  [2]={tp=tk.accept_task,id=8031,text=803124,},  
 },
--task 8032 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=803231,},
  [2]={tp=tk.complete_task,id=8032,text=803232,},
 },
--task 8033 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=803321,},
  [2]={tp=tk.page,id=19,text=803322,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=803323,},
  [2]={tp=tk.accept_task,id=8033,text=803324,},
 },
--task 8036 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=803631,},
  [2]={tp=tk.complete_task,id=8036,text=803632,},
 },
--task 8037 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=803721,},
  [2]={tp=tk.page,id=22,text=803722,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=803723,},
  [2]={tp=tk.accept_task,id=8037,text=803724,},
 },
--task 8041 complete_talk
 [23]=
 {
  [1]={tp=tk.text,text=804131,},
  [2]={tp=tk.complete_task,id=8041,text=804132,},
 },
--task 8042 accept_talk
 [24]=
 {
  [1]={tp=tk.text,text=804221,},
  [2]={tp=tk.page,id=25,text=804222,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=804223,},
  [2]={tp=tk.accept_task,id=8042,text=804224,},
 },
--task 8062 complete_talk 
 [26]=
 {
  [1]={tp=tk.text,text=806231,},
  [2]={tp=tk.complete_task,id=8062,text=806232,},
 },
--task 8063 accept_talk
 [27]=
 {
  [1]={tp=tk.text,text=806321,},
  [2]={tp=tk.page,id=28,text=806322,},
 },
 [28]=
 {
  [1]={tp=tk.text,text=806323,},
  [2]={tp=tk.accept_task,id=8063,text=806324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]