--单个npc对话:npc_10131009.lua
local npc_id=10131009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100911,},
  [2]={tp=tk.accept_check,id={12051,12055,12056,12060,12064,12067,12070,12072,12076,12079},},
  [3]={tp=tk.complete_check,id={12050,12080,12055,12059,12063,12066,12069,12081,12075,12078},},
  [4]={tp=tk.close,text=1,},
 },
--task 12050 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1205031,},
  [2]={tp=tk.complete_task,id=12050,text=1205032,},
 },
--task 12051 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1205121,},
  [2]={tp=tk.accept_task,id=12051,text=1205122,},
 },
--task 12080 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1208031,},
  [2]={tp=tk.complete_task,id=12080,text=1208032,},
 },
--task 12055 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1205521,},
  [2]={tp=tk.page,id=15,text=1205522,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1205523,},
  [2]={tp=tk.accept_task,id=12055,text=1205524,},
 },
--task 12055 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=1205531,},
  [2]={tp=tk.complete_task,id=12055,text=1205532,},
 },
--task 12056 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=1205621,},
  [2]={tp=tk.page,id=6,text=1205622,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=1205623,},
  [2]={tp=tk.accept_task,id=12056,text=1205624,},
 },
--task 12059 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1205931,},
  [2]={tp=tk.complete_task,id=12059,text=1205932,},
 },
--task 12060 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1206021,},
  [2]={tp=tk.page,id=9,text=1206022,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1206023,},
  [2]={tp=tk.accept_task,id=12060,text=1206024,},
 },
--task 12063 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1206331,},
  [2]={tp=tk.complete_task,id=12063,text=1206332,},
 },
--task 12064 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=1206421,},
  [2]={tp=tk.accept_task,id=12064,text=1206422,},
 },
--task 12066 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=1206631,},
  [2]={tp=tk.complete_task,id=12066,text=1206632,},
 },
--task 12067 accept_talk
 [28]=
 {
  [1]={tp=tk.text,text=1206721,},
  [2]={tp=tk.page,id=29,text=1206722,},
 },
 [29]=
 {
  [1]={tp=tk.text,text=1206723,},
  [2]={tp=tk.accept_task,id=12067,text=1206724,},
 },
--task 12069 complete_talk
 [27]=
 {
  [1]={tp=tk.text,text=1206931,},
  [2]={tp=tk.complete_task,id=12069,text=1206932,},
 },
--task 12070 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=1207021,},
  [2]={tp=tk.page,id=17,text=1207022,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=1207023,},
  [2]={tp=tk.accept_task,id=12070,text=1207024,},
 },
--task 12081 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=1208131,},
  [2]={tp=tk.complete_task,id=12081,text=1208132,},
 },
--task 12072 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=1207221,},
  [2]={tp=tk.page,id=20,text=1207222,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=1207223,},
  [2]={tp=tk.accept_task,id=12072,text=1207224,},
 },
--task 12075 complete_talk
 [21]=
 {
  [1]={tp=tk.text,text=1207531,},
  [2]={tp=tk.complete_task,id=12075,text=1207532,},
 },
--task 12076 accept_talk
 [22]=
 {
  [1]={tp=tk.text,text=1207621,},
  [2]={tp=tk.page,id=23,text=1207622,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=1207623,},
  [2]={tp=tk.accept_task,id=12076,text=1207624,},
 },
--task 12078 complete_talk
 [24]=
 {
  [1]={tp=tk.text,text=1207831,},
  [2]={tp=tk.complete_task,id=12078,text=1207832,},
 },
--task 12079 accept_talk
 [25]=
	{
	 [1]={tp=tk.text,text=1207921,},
	 [2]={tp=tk.page,id=26,text=1207922,},
	},
	[26]=
	{
	 [1]={tp=tk.text,text=1207923,},
	 [2]={tp=tk.accept_task,id=12079,text=1207924,},
	},
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]