--单个npc对话:npc_10081015.lua
local npc_id=10081015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101511,},
  [2]={tp=tk.accept_check,id={8019,8072},},
  [3]={tp=tk.complete_check,id={8018,8071},},
  [4]={tp=tk.close,text=1,},
 },
--task 8018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=801831,},
  [2]={tp=tk.complete_task,id=8018,text=801832,},
 },
--task 8019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=801921,},
  [2]={tp=tk.page,id=4,text=801922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=801923,},
  [2]={tp=tk.accept_task,id=8019,text=801924,},
 },
--task 8071 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=807131,},
  [2]={tp=tk.complete_task,id=8071,text=807132,},
 },
--task 8072 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=807221,},
  [2]={tp=tk.page,id=7,text=807222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=807223,},
  [2]={tp=tk.accept_task,id=8072,text=807224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 