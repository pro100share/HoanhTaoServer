--单个npc对话:npc_10101010.lua
local npc_id=10101010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101011,},
  [2]={tp=tk.accept_check,id={9069,9070},},
  [3]={tp=tk.complete_check,id={9068,9069},},
  [8]={tp=tk.close,text=1,},
 },
--task 9068 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=906831,},
  [2]={tp=tk.complete_task,id=9068,text=906832,},
 },
--task 9069 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=906921,},
  [2]={tp=tk.page,id=4,text=906922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=906923,},
  [2]={tp=tk.accept_task,id=9069,text=906924,},
 },
--task 9069 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=906931,},
  [2]={tp=tk.complete_task,id=9069,text=906932,},
 },
--task 9070 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=907021,},
  [2]={tp=tk.page,id=7,text=907022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=907023,},
  [2]={tp=tk.accept_task,id=9070,text=907024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]