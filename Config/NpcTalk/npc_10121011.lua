--单个npc对话:npc_10121011.lua
local npc_id=10121011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101111,},
  [2]={tp=tk.accept_check,id={11026,11029,11030},},
  [3]={tp=tk.complete_check,id={11025,11028,11029},},
  [4]={tp=tk.close,text=1,},
 },
--task 11025 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1102531,},
  [2]={tp=tk.complete_task,id=11025,text=1102532,},
 },
--task 11026 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1102621,},
  [2]={tp=tk.page,id=4,text=1102622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1102623,},
  [2]={tp=tk.accept_task,id=11026,text=1102624,},
 },
--task 11028 complete_talk
 [5]=
	{
	 [1]={tp=tk.text,text=1102831,},
	 [2]={tp=tk.complete_task,id=11028,text=1102832,},
	},
--task 11029 accept_talk 
 [6]=
 {
  [1]={tp=tk.text,text=1102921,},
  [2]={tp=tk.page,id=7,text=1102922,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1102923,},
  [2]={tp=tk.accept_task,id=11029,text=1102924,},
 },
--task 11029 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1102931,},
  [2]={tp=tk.complete_task,id=11029,text=1102932,},
 },
--task 11030 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1103021,},
  [2]={tp=tk.page,id=10,text=1103022,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1103023,},
  [2]={tp=tk.accept_task,id=11030,text=1103024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]