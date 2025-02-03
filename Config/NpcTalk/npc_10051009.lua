--单个npc对话:npc_10051009.lua
local npc_id=10051009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100911,},
  [2]={tp=tk.accept_check,id={4029,4030,4033},},
  [3]={tp=tk.complete_check,id={4028,4029,4032},},
  [8]={tp=tk.close,text=1,},
 },
--task 4028 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=402831,},
  [2]={tp=tk.complete_task,id=4028,text=402832,},
 },
--task 4029 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=402921,},
  [2]={tp=tk.accept_task,id=4029,text=402922,},
 },
--task 4029 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=402931,},
  [2]={tp=tk.complete_task,id=4029,text=402932,},
 },
--task 4030 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=403021,},
  [2]={tp=tk.accept_task,id=4030,text=403022,},
 },
--task 4032 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=403231,},
  [2]={tp=tk.complete_task,id=4032,text=403232,},
 },
--task 4033 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=403321,},
  [2]={tp=tk.page,id=10,text=403322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=403323,},
  [2]={tp=tk.accept_task,id=4033,text=403324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]