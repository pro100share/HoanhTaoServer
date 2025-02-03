--单个npc对话:npc_10051001.lua
local npc_id=10051001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100111,},
  [2]={tp=tk.accept_check,id={4005,4006,4007,4008,4009,4010,4011},},
  [3]={tp=tk.complete_check,id={4004,4005,4006,4007,4008,4009,4010},},
  [8]={tp=tk.close,text=1,},
 },
--task 4004 complete_talk
 [21]=
 {
  [1]={tp=tk.text,text=400431,},
  [2]={tp=tk.complete_task,id=4004,text=400432,},
 },
--task 4005 accept_talk
 [22]=
 {
  [1]={tp=tk.text,text=400521,},
  [2]={tp=tk.page,id=23,text=400522,},
 },
 [23]=
	{
	 [1]={tp=tk.text,text=400523,},
	 [2]={tp=tk.accept_task,id=4005,text=400524,},
	}, 
--task 4005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=400531,},
  [2]={tp=tk.complete_task,id=4005,text=400532,},
 },
--task 4006 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=400621,},
  [2]={tp=tk.page,id=4,text=400622,},
 },
	[4]=
	{
	 [1]={tp=tk.text,text=400623,},
	 [2]={tp=tk.accept_task,id=4006,text=400624,},
	},
--task 4006 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=400631,},
  [2]={tp=tk.complete_task,id=4006,text=400632,},
 },
--task 4007 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=400721,},
  [2]={tp=tk.page,id=7,text=400722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=400723,},
  [2]={tp=tk.accept_task,id=4007,text=400724,},
 },
--task 4007 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=400731,},
  [2]={tp=tk.complete_task,id=4007,text=400732,},
 },
--task 4008 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=400821,},
  [2]={tp=tk.page,id=10,text=400822,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=400823,},
  [2]={tp=tk.page,id=11,text=400824,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=400825,},
  [2]={tp=tk.accept_task,id=4008,text=400826,},
 },
--task 4008 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=400831,},
  [2]={tp=tk.complete_task,id=4008,text=400832,},
 },
--task 4009 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=400921,},
  [2]={tp=tk.page,id=14,text=400922,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=400923,},
  [2]={tp=tk.page,id=24,text=400924,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=400925,},
  [2]={tp=tk.accept_task,id=4009,text=400926,},
 },
--task 4009 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=400931,},
  [2]={tp=tk.complete_task,id=4009,text=400932,},
 },
--task 4010 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=401021,},
  [2]={tp=tk.page,id=17,text=401022,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=401023,},
  [2]={tp=tk.accept_task,id=4010,text=401024,},
 },
--task 4010 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=401031,},
  [2]={tp=tk.complete_task,id=4010,text=401032,},
 },
--task 4011 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=401121,},
  [2]={tp=tk.page,id=20,text=401122,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=401123,},
  [2]={tp=tk.accept_task,id=4011,text=401124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]