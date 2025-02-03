--单个npc对话:npc_10101005.lua
local npc_id=10101005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100511,},
  [2]={tp=tk.accept_check,id={9007,9011,9013},},
  [3]={tp=tk.complete_check,id={9006,9010,9012},},
  [8]={tp=tk.close,text=1,},
 },
--task 9006 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=900631,},
  [2]={tp=tk.complete_task,id=9006,text=900632,},
 },
--task 9007 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=900721,},
  [2]={tp=tk.page,id=4,text=900722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=900723,},
  [2]={tp=tk.accept_task,id=9007,text=900724,},
 },
--task 9010 complete_talk
 [5]=
	{
	 [1]={tp=tk.text,text=901031,},
	 [2]={tp=tk.complete_task,id=9010,text=901032,},
	},
--task 9011 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=901121,},
  [2]={tp=tk.page,id=7,text=901122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=901123,},
  [2]={tp=tk.accept_task,id=9011,text=901124,},
 },
--task 9012 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=901231,},
  [2]={tp=tk.complete_task,id=9012,text=901232,},
 },
--task 9013 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=901321,},
  [2]={tp=tk.page,id=10,text=901322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=901323,},
  [2]={tp=tk.accept_task,id=9013,text=901324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]