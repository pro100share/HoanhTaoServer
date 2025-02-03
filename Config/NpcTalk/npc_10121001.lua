--单个npc对话:npc_10121001.lua
local npc_id=10121001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100111,},
  [2]={tp=tk.accept_check,id={11001,11002,11003,11006},},
  [3]={tp=tk.complete_check,id={10079,11001,11002,11005},},
  [4]={tp=tk.close,text=1,},
 },
--task 10079 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1007931,},
  [2]={tp=tk.complete_task,id=10079,text=1007932,},
 },
--task 11001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1100121,},
  [2]={tp=tk.page,id=4,text=1100122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1100123,},
  [2]={tp=tk.page,id=5,text=1100124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1100125,},
  [2]={tp=tk.accept_task,id=11001,text=1100126,},
 },
--task 11001 complete_talk
 [6]=
	{
	 [1]={tp=tk.text,text=1100131,},
	 [2]={tp=tk.complete_task,id=11001,text=1100132,},
	},
--task 11002 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1100221,},
  [2]={tp=tk.accept_task,id=11002,text=1100222,},
	},
--task 11002 complete_talk 
 [8]=
 {
  [1]={tp=tk.text,text=1100231,},
  [2]={tp=tk.complete_task,id=11002,text=1100232,},
 },
--task 11003 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1100321,},
  [2]={tp=tk.page,id=10,text=1100322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1100323,},
  [2]={tp=tk.accept_task,id=11003,text=1100324,},
 },
--task 11005 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1100531,},
  [2]={tp=tk.complete_task,id=11005,text=1100532,},
 },
--task 11006 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1100621,},
  [2]={tp=tk.page,id=13,text=1100622,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1100623,},
  [2]={tp=tk.accept_task,id=11006,text=1100624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]