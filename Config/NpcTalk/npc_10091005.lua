--单个npc对话:npc_10091005.lua
local npc_id=10091005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100511,},
  [2]={tp=tk.accept_check,id={7012,7016,7036,7038,7039,7040},},
  [3]={tp=tk.complete_check,id={7011,7015,7035,7037,7038,7039},},
  [4]={tp=tk.close,text=1,},
 },
--task 7011 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=701131,},
  [2]={tp=tk.complete_task,id=7011,text=701132,},
 },
--task 7012 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=701221,},
  [2]={tp=tk.accept_task,id=7012,text=701222,},
 },
--task 7015 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=701531,},
  [2]={tp=tk.complete_task,id=7015,text=701532,},
 },
--task 7016 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=701621,},
  [2]={tp=tk.page,id=6,text=701622,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=701623,},
  [2]={tp=tk.accept_task,id=7016,text=701624,},
 },
--task 7035 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=703531,},
  [2]={tp=tk.complete_task,id=7035,text=703532,},
 },
--task 7036 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=703621,},
  [2]={tp=tk.page,id=9,text=703622,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=703623,},
  [2]={tp=tk.accept_task,id=7036,text=703624,},
 },
--task 7037 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=703731,},
  [2]={tp=tk.complete_task,id=7037,text=703732,},
 },
--task 7038 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=703821,},
  [2]={tp=tk.page,id=12,text=703822,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=703823,},
  [2]={tp=tk.accept_task,id=7038,text=703824,},
 },
--task 7038 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=703831,},
  [2]={tp=tk.complete_task,id=7038,text=703832,},
 },
--task 7039 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=703921,},
  [2]={tp=tk.page,id=15,text=703922,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=703923,},
  [2]={tp=tk.accept_task,id=7039,text=703924,},
 },
--task 7039 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=703931,},
  [2]={tp=tk.complete_task,id=7039,text=703932,},
 },
--task 7040 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=704021,},
  [2]={tp=tk.accept_task,id=7040,text=704022,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]