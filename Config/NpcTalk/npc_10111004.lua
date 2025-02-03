--单个npc对话:npc_10111004.lua
local npc_id=10111004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100411,},
  [2]={tp=tk.accept_check,id={10006,10011,10039,10049,10051,10052,10055},},
  [3]={tp=tk.complete_check,id={10005,10010,10038,10048,10050,10051,10054},},
  [8]={tp=tk.close,text=1,},
 },
--task 10005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1000531,},
  [2]={tp=tk.complete_task,id=10005,text=1000532,},
 },
--task 10006 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1000621,},
  [2]={tp=tk.page,id=4,text=1000622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1000623,},
  [2]={tp=tk.accept_task,id=10006,text=1000624,},
 },
--task 10010 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1001031,},
  [2]={tp=tk.complete_task,id=10010,text=1001032,},
 },
--task 10011 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1001121,},
  [2]={tp=tk.page,id=7,text=1001122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1001123,},
  [2]={tp=tk.accept_task,id=10011,text=1001124,},
 },
--task 10038 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1003831,},
  [2]={tp=tk.complete_task,id=10038,text=1003832,},
 },
--task 10039 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1003921,},
  [2]={tp=tk.accept_task,id=10039,text=1003922,},
 },
--task 10048 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1004831,},
  [2]={tp=tk.complete_task,id=10048,text=1004832,},
 },
--task 10049 accept_talk 
 [11]=
 {
  [1]={tp=tk.text,text=1004921,},
  [2]={tp=tk.page,id=12,text=1004922,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1004923,},
  [2]={tp=tk.accept_task,id=10049,text=1004924,},
 },
--task 10050 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1005031,},
  [2]={tp=tk.complete_task,id=10050,text=1005032,},
 },
--task 10051 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1005121,},
  [2]={tp=tk.page,id=15,text=1005122,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1005123,},
  [2]={tp=tk.accept_task,id=10051,text=1005124,},
 },
--task 10051 complete_talk
 [19]=
 {
  [1]={tp=tk.text,text=1005131,},
  [2]={tp=tk.complete_task,id=10051,text=1005132,},
 },
--task 10052 accept_talk
 [20]=
 {
  [1]={tp=tk.text,text=1005221,},
  [2]={tp=tk.page,id=21,text=1005222,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=1005223,},
  [2]={tp=tk.accept_task,id=10052,text=1005224,},
 },
--task 10054 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=1005431,},
  [2]={tp=tk.complete_task,id=10054,text=1005432,},
 },
--task 10055 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=1005521,},
  [2]={tp=tk.page,id=18,text=1005522,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=1005523,},
  [2]={tp=tk.accept_task,id=10055,text=1005524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]