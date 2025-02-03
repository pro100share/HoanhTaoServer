--单个npc对话:npc_10121030.lua
local npc_id=10121030
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012103011,},
  [2]={tp=tk.accept_check,id={11067,11069},},
  [3]={tp=tk.complete_check,id={11066,11068},},
  [4]={tp=tk.close,text=1,},
 },
--task 11066 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1106631,},
  [2]={tp=tk.complete_task,id=11066,text=1106632,},
 },
--task 11067 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1106721,},
  [2]={tp=tk.page,id=4,text=1106722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1106723,},
  [2]={tp=tk.accept_task,id=11067,text=1106724,},
 },
--task 11068 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1106831,},
  [2]={tp=tk.complete_task,id=11068,text=1106832,},
 },
--task 11069 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1106921,},
  [2]={tp=tk.page,id=7,text=1106922,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1106923,},
  [2]={tp=tk.accept_task,id=11069,text=1106924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]