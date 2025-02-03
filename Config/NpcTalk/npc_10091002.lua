--单个npc对话:npc_10091002.lua
local npc_id=10091002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100211,},
  [2]={tp=tk.accept_check,id={7009,7010,7011,7019,7020,7024,7025,7027,7031,7058},},
  [3]={tp=tk.complete_check,id={7008,7009,7010,7018,7019,7023,7024,7026,7030,7057},},
  [4]={tp=tk.close,text=1,},
 },
--task 7008 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=700831,},
  [2]={tp=tk.complete_task,id=7008,text=700832,},
 },
--task 7009 accept_talk
 [3]=
	{
	 [1]={tp=tk.text,text=700921,},
	 [2]={tp=tk.page,id=4,text=700922,},
	},
	[4]=
	{
	 [1]={tp=tk.text,text=700923,},
	 [2]={tp=tk.accept_task,id=7009,text=700924,},
	},
--task 7009 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=700931,},
  [2]={tp=tk.complete_task,id=7009,text=700932,},
 },
--task 7010 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=701021,},
  [2]={tp=tk.page,id=7,text=701022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=701023,},
  [2]={tp=tk.accept_task,id=7010,text=701024,},
 },
--task 7010 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=701031,},
  [2]={tp=tk.complete_task,id=7010,text=701032,},
 },
--task 7011 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=701121,},
  [2]={tp=tk.page,id=10,text=701122,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=701123,},
  [2]={tp=tk.accept_task,id=7011,text=701124,},
 },
--task 7018 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=701831,},
  [2]={tp=tk.complete_task,id=7018,text=701832,},
 },
--task 7019 accept_talk
	[12]=
	{
	 [1]={tp=tk.text,text=701921,},
	 [2]={tp=tk.accept_task,id=7019,text=701922,},
	},
--task 7019 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=701931,},
  [2]={tp=tk.complete_task,id=7019,text=701932,},
 },
--task 7020 accept_talk 
	[15]=
	{
	 [1]={tp=tk.text,text=702021,},
	 [2]={tp=tk.accept_task,id=7020,text=702022,},
	},
--task 7023 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=702331,},
  [2]={tp=tk.complete_task,id=7023,text=702332,},
 },
--task 7024 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=702421,},
  [2]={tp=tk.page,id=18,text=702422,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=702423,},
  [2]={tp=tk.accept_task,id=7024,text=702424,},
 },
--task 7024 complete_talk 
 [19]=
 {
  [1]={tp=tk.text,text=702431,},
  [2]={tp=tk.complete_task,id=7024,text=702432,},
 },
--task 7025 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=702521,},
  [2]={tp=tk.page,id=27,text=702522,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=702523,},
  [2]={tp=tk.accept_task,id=7025,text=702524,},
 },
--task 7026 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=702631,},
  [2]={tp=tk.complete_task,id=7026,text=702632,},
 },
--task 7027 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=702721,},
  [2]={tp=tk.page,id=22,text=702722,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=702723,},
  [2]={tp=tk.accept_task,id=7027,text=702724,},
 },
--task 7030 complete_talk
 [23]=
 {
  [1]={tp=tk.text,text=703031,},
  [2]={tp=tk.complete_task,id=7030,text=703032,},
 },
--task 7031 accept_talk
 [24]=
 {
  [1]={tp=tk.text,text=703121,},
  [2]={tp=tk.page,id=25,text=703122,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=703123,},
  [2]={tp=tk.accept_task,id=7031,text=703124,},
 },
--task 7057 complete_talk
 [28]=
 {
  [1]={tp=tk.text,text=705731,},
  [2]={tp=tk.complete_task,id=7057,text=705732,},
 },
--task 7058 accept_talk
 [29]=
 {
  [1]={tp=tk.text,text=705821,},
  [2]={tp=tk.page,id=30,text=705822,},
 },
 [30]=
 {
  [1]={tp=tk.text,text=705823,},
  [2]={tp=tk.page,id=31,text=705824,},
 },
 [31]=
 {
  [1]={tp=tk.text,text=705825,},
  [2]={tp=tk.accept_task,id=7058,text=705826,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]