--单个npc对话:npc_10131003.lua
local npc_id=10131003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100311,},
  [2]={tp=tk.accept_check,id={12011,12031,12054,12057,12058},},
  [3]={tp=tk.complete_check,id={12010,12030,12053,12056,12057},},
  [4]={tp=tk.close,text=1,},
 },
--task 12010 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1201031,},
  [2]={tp=tk.complete_task,id=12010,text=1201032,},
 },
--task 12011 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1201121,},
  [2]={tp=tk.accept_task,id=12011,text=1201122,},
 },
--task 12030 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1203031,},
  [2]={tp=tk.complete_task,id=12030,text=1203032,},
 },
--task 12031 accept_talk 
	[6]=
	{
	 [1]={tp=tk.text,text=1203121,},
	 [2]={tp=tk.page,id=7,text=1203122,},
	},
	[7]=
	{
	 [1]={tp=tk.text,text=1203123,},
	 [2]={tp=tk.accept_task,id=12031,text=1203124,},
	},
--task 12053 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1205331,},
  [2]={tp=tk.complete_task,id=12053,text=1205332,},
 },
--task 12054 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1205421,},
  [2]={tp=tk.accept_task,id=12054,text=1205422,},
 },
--task 12056 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1205631,},
  [2]={tp=tk.complete_task,id=12056,text=1205632,},
 }, 
--task 12057 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=1205721,},
  [2]={tp=tk.page,id=12,text=1205722,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1205723,},
  [2]={tp=tk.accept_task,id=12057,text=1205724,},
 },
--task 12057 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1205731,},
  [2]={tp=tk.complete_task,id=12057,text=1205732,},
 },
--task 12058 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1205821,},
  [2]={tp=tk.page,id=15,text=1205822,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1205823,},
  [2]={tp=tk.accept_task,id=12058,text=1205824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]