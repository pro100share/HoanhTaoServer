--单个npc对话:npc_10111002.lua
local npc_id=10111002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100211,},
  [2]={tp=tk.accept_check,id={10002,10010,10033,10047,10054},},
  [3]={tp=tk.complete_check,id={10001,10009,10032,10046,10047,10052,10073},},
  [8]={tp=tk.close,text=1,},
 },
--task 10001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1000131,},
  [2]={tp=tk.complete_task,id=10001,text=1000132,},
 },
--task 10002 accept_talk 
 [3]=
 {
  [1]={tp=tk.text,text=1000221,},
  [2]={tp=tk.page,id=4,text=1000222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1000223,},
  [2]={tp=tk.accept_task,id=10002,text=1000224,},
 },
--task 10009 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1000931,},
  [2]={tp=tk.complete_task,id=10009,text=1000932,},
 },
--task 10010 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1001021,},
  [2]={tp=tk.page,id=17,text=1001022,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=1001023,},
  [2]={tp=tk.accept_task,id=10010,text=1001024,},
 },
--task 10032 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1003231,},
  [2]={tp=tk.complete_task,id=10032,text=1003232,},
 },
--task 10033 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1003321,},
  [2]={tp=tk.page,id=9,text=1003322,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1003323,},
  [2]={tp=tk.accept_task,id=10033,text=1003324,},
 },
--task 10046 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1004631,},
  [2]={tp=tk.complete_task,id=10046,text=1004632,},
 },
--task 10047 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=1004721,},
  [2]={tp=tk.page,id=12,text=1004722,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1004723,},
  [2]={tp=tk.accept_task,id=10047,text=1004724,},
 },
--task 10047 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1004731,},
  [2]={tp=tk.complete_task,id=10047,text=1004732,},
 },
--task 10052 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=1005231,},
  [2]={tp=tk.complete_task,id=10052,text=1005232,},
 },
--task 10073 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=1007331,},
  [2]={tp=tk.complete_task,id=10073,text=1007332,},
 },
--task 10054 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=1005421,},
  [2]={tp=tk.page,id=16,text=1005422,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=1005423,},
  [2]={tp=tk.accept_task,id=10054,text=1005424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]