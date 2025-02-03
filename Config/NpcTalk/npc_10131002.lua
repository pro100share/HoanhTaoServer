--单个npc对话:npc_10131002.lua
local npc_id=10131002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100211,},
  [2]={tp=tk.accept_check,id={12005,12007,12009,12012,12015},},
  [3]={tp=tk.complete_check,id={12004,12006,12008,12011,12014},},
  [4]={tp=tk.close,text=1,},
 },
--task 12004 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1200431,},
  [2]={tp=tk.complete_task,id=12004,text=1200432,},
 },
--task 12005 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1200521,},
  [2]={tp=tk.page,id=4,text=1200522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1200523,},
  [2]={tp=tk.accept_task,id=12005,text=1200524,},
 },
--task 12006 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1200631,},
  [2]={tp=tk.complete_task,id=12006,text=1200632,},
 },
--task 12007 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1200721,},
  [2]={tp=tk.page,id=7,text=1200722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1200723,},
  [2]={tp=tk.accept_task,id=12007,text=1200724,},
 },
--task 12008 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1200831,},
  [2]={tp=tk.complete_task,id=12008,text=1200832,},
 },
--task 12009 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1200921,},
  [2]={tp=tk.page,id=10,text=1200922,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1200923,},
  [2]={tp=tk.accept_task,id=12009,text=1200924,},
 },
--task 12011 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1201131,},
  [2]={tp=tk.complete_task,id=12011,text=1201132,},
 },
--task 12012 accept_talk 
	[12]=
	{
	 [1]={tp=tk.text,text=1201221,},
	 [2]={tp=tk.page,id=13,text=1201222,},
	},
	[13]=
	{
	 [1]={tp=tk.text,text=1201223,},
	 [2]={tp=tk.accept_task,id=12012,text=1201224,},
	},
--task 12014 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=1201431,},
  [2]={tp=tk.complete_task,id=12014,text=1201432,},
 },
--task 12015 accept_talk 
	[15]=
	{
	 [1]={tp=tk.text,text=1201521,},
	 [2]={tp=tk.page,id=16,text=1201522,},
	},
	[16]=
	{
	 [1]={tp=tk.text,text=1201523,},
	 [2]={tp=tk.accept_task,id=12015,text=1201524,},
	},
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]