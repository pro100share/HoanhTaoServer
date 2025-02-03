--单个npc对话:npc_10111017.lua
local npc_id=10111017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101711,},
  [2]={tp=tk.accept_check,id={10074,10078,10079},},
  [3]={tp=tk.complete_check,id={10070,10077,10078},},
  [8]={tp=tk.close,text=1,},
 },
--task 10070 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1007031,},
  [2]={tp=tk.complete_task,id=10070,text=1007032,},
 },
--task 10074 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1007421,},
  [2]={tp=tk.page,id=4,text=1007422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1007423,},
  [2]={tp=tk.page,id=5,text=1007424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1007425,},
  [2]={tp=tk.accept_task,id=10074,text=1007426,},
 },
--task 10077 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1007731,},
  [2]={tp=tk.complete_task,id=10077,text=1007732,},
 },
--task 10078 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1007821,},
  [2]={tp=tk.page,id=10,text=1007822,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1007823,},
  [2]={tp=tk.accept_task,id=10078,text=1007824,},
 },
--task 10078 complete_talk 
 [11]=
 {
  [1]={tp=tk.text,text=1007831,},
  [2]={tp=tk.complete_task,id=10078,text=1007832,},
 },
--task 10079 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1007921,},
  [2]={tp=tk.page,id=13,text=1007922,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1007923,},
  [2]={tp=tk.accept_task,id=10079,text=1007924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]