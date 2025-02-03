--单个npc对话:npc_10111005.lua
local npc_id=10111005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100511,},
  [2]={tp=tk.accept_check,id={10007,10008,10009},},
  [3]={tp=tk.complete_check,id={10006,10007,10008},},
  [8]={tp=tk.close,text=1,},
 },
--task 10006 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1000631,},
  [2]={tp=tk.complete_task,id=10006,text=1000632,},
 },
--task 10007 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1000721,},
  [2]={tp=tk.accept_task,id=10007,text=1000722,},
 },
--task 10007 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=1000731,},
  [2]={tp=tk.complete_task,id=10007,text=1000732,},
 },
--task 10008 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=1000821,},
  [2]={tp=tk.page,id=6,text=1000822,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=1000823,},
  [2]={tp=tk.accept_task,id=10008,text=1000824,},
 },
--task 10008 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1000831,},
  [2]={tp=tk.complete_task,id=10008,text=1000832,},
 },
--task 10009 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1000921,},
  [2]={tp=tk.page,id=9,text=1000922,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1000923,},
  [2]={tp=tk.accept_task,id=10009,text=1000924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]