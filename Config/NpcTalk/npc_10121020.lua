--单个npc对话:npc_10121020.lua
local npc_id=10121020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102011,},
  [2]={tp=tk.accept_check,id={11053,11056,11059},},
  [3]={tp=tk.complete_check,id={11052,11055,11079},},
  [4]={tp=tk.close,text=1,},
 },
--task 11052 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1105231,},
  [2]={tp=tk.complete_task,id=11052,text=1105232,},
 },
--task 11053 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1105321,},
  [2]={tp=tk.page,id=4,text=1105322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1105323,},
  [2]={tp=tk.accept_task,id=11053,text=1105324,},
 },
--task 11055 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1105531,},
  [2]={tp=tk.complete_task,id=11055,text=1105532,},
 },
--task 11056 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1105621,},
  [2]={tp=tk.accept_task,id=11056,text=1105622,},
 },
--task 11079 complete_talk
	[7]=
	{
	 [1]={tp=tk.text,text=1107931,},
	 [2]={tp=tk.complete_task,id=11079,text=1107932,},
	},
--task 11059 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1105921,},
  [2]={tp=tk.accept_task,id=11059,text=1105922,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]