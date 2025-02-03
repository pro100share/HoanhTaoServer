--单个npc对话:npc_10101002.lua
local npc_id=10101002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100211,},
  [2]={tp=tk.accept_check,id={9026,9036,9037,9039,9065,9068},},
  [3]={tp=tk.complete_check,id={9025,9035,9036,9038,9064,9067},},
  [8]={tp=tk.close,text=1,},
 },
--task 9025 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=902531,},
  [2]={tp=tk.complete_task,id=9025,text=902532,},
 },
--task 9026 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=902621,},
  [2]={tp=tk.page,id=4,text=902622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=902623,},
  [2]={tp=tk.accept_task,id=9026,text=902624,},
 },
--task 9035 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=903531,},
  [2]={tp=tk.complete_task,id=9035,text=903532,},
 },
--task 9036 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=903621,},
  [2]={tp=tk.page,id=7,text=903622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=903623,},
  [2]={tp=tk.accept_task,id=9036,text=903624,},
 },
--task 9036 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=903631,},
  [2]={tp=tk.complete_task,id=9036,text=903632,},
 },
--task 9037 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=903721,},
  [2]={tp=tk.page,id=10,text=903722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=903723,},
  [2]={tp=tk.accept_task,id=9037,text=903724,},
 },
--task 9038 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=903831,},
  [2]={tp=tk.complete_task,id=9038,text=903832,},
 },
--task 9039 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=903921,},
  [2]={tp=tk.page,id=13,text=903922,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=903923,},
  [2]={tp=tk.accept_task,id=9039,text=903924,},
 },
--task 9064 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=906431,},
  [2]={tp=tk.complete_task,id=9064,text=906432,},
 },
--task 9065 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=906521,},
  [2]={tp=tk.accept_task,id=9065,text=906522,},
 },
--task 9067 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=906731,},
  [2]={tp=tk.complete_task,id=9067,text=906732,},
 },
--task 9068 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=906821,},
  [2]={tp=tk.page,id=18,text=906822,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=906823,},
  [2]={tp=tk.page,id=19,text=906824,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=906825,},
  [2]={tp=tk.accept_task,id=9068,text=906826,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]