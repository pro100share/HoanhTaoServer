--单个npc对话:npc_10101004.lua
local npc_id=10101004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100411,},
  [2]={tp=tk.accept_check,id={9001,9002,9003,9004,9014,9015,9059},},
  [3]={tp=tk.complete_check,id={8072,9001,9002,9003,9004,9005,9013,9014,9058},},
  [8]={tp=tk.close,text=1,},
 },
--task 8072 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=807231,},
  [2]={tp=tk.complete_task,id=8072,text=807232,},
 },
--task 9001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=900121,},
  [2]={tp=tk.page,id=4,text=900122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=900123,},
  [2]={tp=tk.accept_task,id=9001,text=900124,},
 },
--task 9001 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=900131,},
  [2]={tp=tk.complete_task,id=9001,text=900132,},
 },
--task 9002 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=900221,},
  [2]={tp=tk.accept_task,id=9002,text=900222,},
 },
--task 9002 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=900231,},
  [2]={tp=tk.complete_task,id=9002,text=900232,},
 },
--task 9003 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=900321,},
  [2]={tp=tk.accept_task,id=9003,text=900322,},
 },
--task 9003 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=900331,},
  [2]={tp=tk.complete_task,id=9003,text=900332,},
 },
--task 9004 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=900421,},
  [2]={tp=tk.page,id=12,text=900422,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=900423,},
  [2]={tp=tk.accept_task,id=9004,text=900424,},
 },
--task 9004 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=900431,},
  [2]={tp=tk.complete_task,id=9004,text=900432,},
 },
--task 9005 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=900531,},
  [2]={tp=tk.complete_task,id=9005,text=900532,},
 },
--task 9013 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=901331,},
  [2]={tp=tk.complete_task,id=9013,text=901332,},
 },
--task 9014 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=901421,},
  [2]={tp=tk.page,id=17,text=901422,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=901423,},
  [2]={tp=tk.accept_task,id=9014,text=901424,},
 },
--task 9014 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=901431,},
  [2]={tp=tk.complete_task,id=9014,text=901432,},
 },
--task 9015 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=901521,},
  [2]={tp=tk.page,id=20,text=901522,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=901523,},
  [2]={tp=tk.accept_task,id=9015,text=901524,},
 },
--task 9058 complete_talk
 [21]=
 {
  [1]={tp=tk.text,text=905831,},
  [2]={tp=tk.complete_task,id=9058,text=905832,},
 },
--task 9059 accept_talk
 [22]=
 {
  [1]={tp=tk.text,text=905921,},
  [2]={tp=tk.page,id=23,text=905922,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=905923,},
  [2]={tp=tk.accept_task,id=9059,text=905924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]