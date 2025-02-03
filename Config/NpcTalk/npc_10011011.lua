--单个npc对话:npc_10011011.lua
local npc_id=10011011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001101111,},
  [2]={tp=tk.accept_check,id={1002,1009},},
  [3]={tp=tk.complete_check,id={1001,1008},},
  [8]={tp=tk.close,text=1,},
 },
--task 1001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=100131,},
  [2]={tp=tk.complete_task,id=1001,text=100132,},
 },
--task 1002 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=100221,},
  [2]={tp=tk.page,id=4,text=100222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=100223,},
  [2]={tp=tk.page,id=5,text=100224,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=100225,},
  [2]={tp=tk.accept_task,id=1002,text=100226,},
 },
--task 1008 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=100831,},
  [2]={tp=tk.complete_task,id=1008,text=100832,},
 },
--task 1009 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=100921,},
  [2]={tp=tk.page,id=8,text=100922,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=100923,},
  [2]={tp=tk.page,id=9,text=100924,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=100925,},
  [2]={tp=tk.accept_task,id=1009,text=100926,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]