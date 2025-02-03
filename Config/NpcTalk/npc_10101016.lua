--单个npc对话:npc_10101016.lua
local npc_id=10101016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101611,},
  [2]={tp=tk.accept_check,id={9060,9061,9063,9066},},
  [3]={tp=tk.complete_check,id={9059,9060,9062,9065},},
  [8]={tp=tk.close,text=1,},
 },
--task 9059 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=905931,},
  [2]={tp=tk.complete_task,id=9059,text=905932,},
 },
--task 9060 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=906021,},
  [2]={tp=tk.page,id=4,text=906022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=906023,},
  [2]={tp=tk.accept_task,id=9060,text=906024,},
 },
--task 9060 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=906031,},
  [2]={tp=tk.complete_task,id=9060,text=906032,},
 },
--task 9061 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=906121,},
  [2]={tp=tk.page,id=7,text=906122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=906123,},
  [2]={tp=tk.accept_task,id=9061,text=906124,},
 },
--task 9062 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=906231,},
  [2]={tp=tk.complete_task,id=9062,text=906232,},
 },
--task 9063 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=906321,},
  [2]={tp=tk.page,id=10,text=906322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=906323,},
  [2]={tp=tk.accept_task,id=9063,text=906324,},
 },
--task 9065 complete_talk 
 [11]=
 {
  [1]={tp=tk.text,text=906531,},
  [2]={tp=tk.complete_task,id=9065,text=906532,},
 },
--task 9066 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=906621,},
  [2]={tp=tk.page,id=13,text=906622,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=906623,},
  [2]={tp=tk.accept_task,id=9066,text=906624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]