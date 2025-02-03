--单个npc对话:npc_10061004.lua
local npc_id=10061004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100411,},
  [2]={tp=tk.accept_check,id={5006,5007,5008,5009,5011},},
  [3]={tp=tk.complete_check,id={5005,5006,5007,5008,5010},},
  [8]={tp=tk.close,text=1,},
 },
--task 5005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=500531,},
  [2]={tp=tk.complete_task,id=5005,text=500532,},
 },
--task 5006 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=500621,},
  [2]={tp=tk.page,id=4,text=500622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=500623,},
  [2]={tp=tk.page,id=5,text=500624,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=500625,},
  [2]={tp=tk.accept_task,id=5006,text=500626,},
 },
--task 5006 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=500631,},
  [2]={tp=tk.complete_task,id=5006,text=500632,},
 },
--task 5007 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=500721,},
  [2]={tp=tk.page,id=8,text=500722,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=500723,},
  [2]={tp=tk.page,id=9,text=500724,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=500725,},
  [2]={tp=tk.accept_task,id=5007,text=500726,},
 },
--task 5007 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=500731,},
  [2]={tp=tk.complete_task,id=5007,text=500732,},
 },
--task 5008 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=500821,},
		[2]={tp=tk.page,id=12,text=500822,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=500823,},
  [2]={tp=tk.page,id=13,text=500824,},
  [3]={tp=tk.page,id=14,text=500825,},
  [4]={tp=tk.page,id=15,text=500826,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=500841,},
  [2]={tp=tk.page,id=12,text=500842,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=500843,},
  [2]={tp=tk.page,id=12,text=500844,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=500845,},
  [2]={tp=tk.accept_task,id=5008,text=500846,},
 },
--task 5008 complete_talk
 [16]=
	{
	 [1]={tp=tk.text,text=500831,},
	 [2]={tp=tk.complete_task,id=5008,text=500832,},
	},
--task 5009 accept_talk
 [17]=
	{
	 [1]={tp=tk.text,text=500921,},
	 [2]={tp=tk.page,id=18,text=500922,},
	},
	[18]=
	{
	 [1]={tp=tk.text,text=500923,},
	 [2]={tp=tk.page,id=19,text=500924,},
	},
	[19]=
	{
	 [1]={tp=tk.text,text=500925,},
	 [2]={tp=tk.accept_task,id=5009,text=500926,},
	},
--task 5010 complete_talk
 [22]=
 {
  [1]={tp=tk.text,text=501031,},
  [2]={tp=tk.complete_task,id=5010,text=501032,},
 },
--task 5011 accept_talk
 [23]=
 {
  [1]={tp=tk.text,text=501121,},
  [2]={tp=tk.accept_task,id=5011,text=501122,},
 },
 -- [24]=
 -- {
  -- [1]={tp=tk.text,text=501123,},
  -- [2]={tp=tk.accept_task,id=5011,text=501124,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]