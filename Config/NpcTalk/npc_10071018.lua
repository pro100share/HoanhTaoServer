--单个npc对话:npc_10071018.lua
local npc_id=10071018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101811,},
  [2]={tp=tk.accept_check,id={6018,6027,6028,6030,6031,6036},},
  [3]={tp=tk.complete_check,id={6017,6026,6027,6029,6030,6035},},
  [4]={tp=tk.close,text=1,},
 },
--task 6017 complete_talk
 [25]=
 {
  [1]={tp=tk.text,text=601731,},
  [2]={tp=tk.complete_task,id=6017,text=601732,},
 },
--task 6018 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=601821,},
  [2]={tp=tk.page,id=27,text=601822,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=601823,},
  [2]={tp=tk.accept_task,id=6018,text=601824,},
 }, 
--task 6026 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=602631,},
  [2]={tp=tk.complete_task,id=6026,text=602632,},
 },
--task 6027 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=602721,},
  [2]={tp=tk.page,id=4,text=602722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=602723,},
  [2]={tp=tk.accept_task,id=6027,text=602724,},
 },
--task 6027 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=602731,},
  [2]={tp=tk.complete_task,id=6027,text=602732,},
 },
--task 6028 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=602821,},
  [2]={tp=tk.page,id=7,text=602822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=602823,},
  [2]={tp=tk.accept_task,id=6028,text=602824,},
 },
--task 6029 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=602931,},
  [2]={tp=tk.complete_task,id=6029,text=602932,},
 },
--task 6030 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=603021,},
  [2]={tp=tk.page,id=10,text=603022,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=603023,},
  [2]={tp=tk.page,id=11,text=603024,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=603025,},
  [2]={tp=tk.accept_task,id=6030,text=603026,},
 },
--task 6030 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=603031,},
  [2]={tp=tk.complete_task,id=6030,text=603032,},
 },
--task 6031 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=603121,},
  [2]={tp=tk.page,id=14,text=603122,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=603123,},
  [2]={tp=tk.accept_task,id=6031,text=603124,},
 },

--task 6035 complete_talk
 [21]=
 {
  [1]={tp=tk.text,text=603531,},
  [2]={tp=tk.complete_task,id=6035,text=603532,},
 },
--task 6036 accept_talk
 [22]=
 { 
		[1]={tp=tk.text,text=603621,},
		[2]={tp=tk.page,id=23,text=603622,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=603623,},
  [2]={tp=tk.page,id=24,text=603624,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=603625,},
  [2]={tp=tk.accept_task,id=6036,text=603626,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  