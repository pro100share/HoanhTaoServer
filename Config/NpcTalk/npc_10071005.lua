--单个npc对话:npc_10071005.lua
local npc_id=10071005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100511,},
  [2]={tp=tk.accept_check,id={6008,6009,6011},},
  [3]={tp=tk.complete_check,id={6007,6008,6010},},
  [4]={tp=tk.close,text=1,},
 },
--task 6007 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=600731,},
  [2]={tp=tk.complete_task,id=6007,text=600732,},
 },
--task 6008 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=600821,},
  [2]={tp=tk.page,id=4,text=600822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=600823,},
  [2]={tp=tk.accept_task,id=6008,text=600824,},
 },
--task 6008 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=600831,},
  [2]={tp=tk.complete_task,id=6008,text=600832,},
 },
--task 6009 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=600921,},
  [2]={tp=tk.page,id=7,text=600922,},
 },
	[7]=
	{
	 [1]={tp=tk.text,text=600923,},
	 [2]={tp=tk.accept_task,id=6009,text=600924,},
	},
--task 6010 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=601031,},
  [2]={tp=tk.complete_task,id=6010,text=601032,},
 },
--task 6011 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=601121,},
  [2]={tp=tk.page,id=10,text=601122,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=601123,},
  [2]={tp=tk.accept_task,id=6011,text=601124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  