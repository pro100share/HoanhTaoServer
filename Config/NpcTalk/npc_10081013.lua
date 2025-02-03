--单个npc对话:npc_10081013.lua
local npc_id=10081013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101311,},
  [2]={tp=tk.accept_check,id={8046,8048,8050,8052,8055,8056},},
  [3]={tp=tk.complete_check,id={8045,8047,8049,8051,8054,8055},},
  [4]={tp=tk.close,text=1,},
 },
--task 8045 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=804531,},
  [2]={tp=tk.complete_task,id=8045,text=804532,},
 },
--task 8046 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=804621,},
  [2]={tp=tk.page,id=4,text=804622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=804623,},
  [2]={tp=tk.page,id=5,text=804624,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=804625,},
  [2]={tp=tk.accept_task,id=8046,text=804626,},
 },
--task 8047 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=804731,},
  [2]={tp=tk.complete_task,id=8047,text=804732,},
 },
--task 8048 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=804821,},
  [2]={tp=tk.page,id=8,text=804822,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=804823,},
  [2]={tp=tk.accept_task,id=8048,text=804824,},
 },
--task 8049 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=804931,},
  [2]={tp=tk.complete_task,id=8049,text=804932,},
 },
--task 8050 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=805021,},
  [2]={tp=tk.page,id=11,text=805022,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=805023,},
  [2]={tp=tk.accept_task,id=8050,text=805024,},
 },
--task 8051 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=805131,},
  [2]={tp=tk.complete_task,id=8051,text=805132,},
 },
--task 8052 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=805221,},
  [2]={tp=tk.page,id=14,text=805222,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=805223,},
  [2]={tp=tk.accept_task,id=8052,text=805224,},
 },
--task 8054 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=805431,},
  [2]={tp=tk.complete_task,id=8054,text=805432,},
 },
--task 8055 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=805521,},
  [2]={tp=tk.page,id=17,text=805522,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=805523,},
  [2]={tp=tk.accept_task,id=8055,text=805524,},
 },
--task 8055 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=805531,},
  [2]={tp=tk.complete_task,id=8055,text=805532,},
 },
--task 8056 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=805621,},
  [2]={tp=tk.page,id=20,text=805622,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=805623,},
  [2]={tp=tk.accept_task,id=8056,text=805624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]