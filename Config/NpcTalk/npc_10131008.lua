--单个npc对话:npc_10131008.lua
local npc_id=10131008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100811,},
  [2]={tp=tk.accept_check,id={12044,12046,12049,12050,12052,12053,12080,12059,12061,12062,12066,12071},},
  [3]={tp=tk.complete_check,id={12043,12045,12048,12049,12051,12052,12054,12058,12060,12061,12065,12070},},
  [4]={tp=tk.find_npc,id={12052},},   
  [5]={tp=tk.close,text=1,},
 },
--task 12043 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1204331,},
  [2]={tp=tk.complete_task,id=12043,text=1204332,},
 },
--task 12044 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1204421,},
  [2]={tp=tk.page,id=4,text=1204422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1204423,},
  [2]={tp=tk.accept_task,id=12044,text=1204424,},
 },
--task 12045 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1204531,},
  [2]={tp=tk.complete_task,id=12045,text=1204532,},
 },
--task 12046 accept_talk 
 [6]=
 {
  [1]={tp=tk.text,text=1204621,},
  [2]={tp=tk.page,id=7,text=1204622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1204623,},
  [2]={tp=tk.page,id=8,text=1204624,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1204625,},
  [2]={tp=tk.accept_task,id=12046,text=1204626,},
 },
--task 12048 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=1204831,},
  [2]={tp=tk.complete_task,id=12048,text=1204832,},
 },
--task 12049 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=1204921,},
  [2]={tp=tk.page,id=11,text=1204922,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=1204923,},
  [2]={tp=tk.page,id=12,text=1204924,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1204925,},
  [2]={tp=tk.accept_task,id=12049,text=1204926,},
 },
--task 12049 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1204931,},
  [2]={tp=tk.complete_task,id=12049,text=1204932,},
 },
--task 12050 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1205021,},
  [2]={tp=tk.page,id=15,text=1205022,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1205023,},
  [2]={tp=tk.accept_task,id=12050,text=1205024,},
 },
--task 12051 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=1205131,},
  [2]={tp=tk.complete_task,id=12051,text=1205132,},
 },
--task 12052 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=1205221,},
  [2]={tp=tk.page,id=18,text=1205222,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=1205223,},
  [2]={tp=tk.accept_task,id=12052,text=1205224,},
 },
--task 12052 uncomplete_talk
 [19]=
 {
  [1]={tp=tk.text,text=1205241,},
  [2]={tp=tk.page,id=20,text=1205242,},
  [3]={tp=tk.page,id=22,text=1205243,},
  [4]={tp=tk.page,id=22,text=1205244,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=1205245,},
  [2]={tp=tk.page,id=21,text=1205246,},
  [3]={tp=tk.page,id=22,text=1205247,},
  [4]={tp=tk.page,id=22,text=1205248,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=1205249,},
  [2]={tp=tk.talk_over,id=12052,text=1205250,},
  [3]={tp=tk.page,id=22,text=1205251,},
  [4]={tp=tk.page,id=22,text=1205252,},  
 },
 [22]=
 {
  [1]={tp=tk.text,text=1205255,},
  [2]={tp=tk.page,id=19,text=1205256,},
 },
--task 12052 complete_talk
 [23]=
 {
  [1]={tp=tk.text,text=1205231,},
  [2]={tp=tk.complete_task,id=12052,text=1205232,},
 },
--task 12053 accept_talk
 [24]=
 {
  [1]={tp=tk.text,text=1205321,},
  [2]={tp=tk.page,id=25,text=1205322,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=1205323,},
  [2]={tp=tk.accept_task,id=12053,text=1205324,},
 },
--task 12054 complete_talk
 [26]=
 {
  [1]={tp=tk.text,text=1205431,},
  [2]={tp=tk.complete_task,id=12054,text=1205432,},
 },
--task 12080 accept_talk
 [27]=
 {
  [1]={tp=tk.text,text=1208021,},
  [2]={tp=tk.page,id=28,text=1208022,},
 },
 [28]=
 {
  [1]={tp=tk.text,text=1208023,},
  [2]={tp=tk.accept_task,id=12080,text=1208024,},
 },
--task 12058 complete_talk
 [29]=
 {
  [1]={tp=tk.text,text=1205831,},
  [2]={tp=tk.complete_task,id=12058,text=1205832,},
 },
--task 12059 accept_talk
 [30]=
 {
  [1]={tp=tk.text,text=1205921,},
  [2]={tp=tk.page,id=31,text=1205922,},
 },
 [31]=
 {
  [1]={tp=tk.text,text=1205923,},
  [2]={tp=tk.accept_task,id=12059,text=1205924,},
 },
--task 12060 complete_talk
 [32]=
 {
  [1]={tp=tk.text,text=1206031,},
  [2]={tp=tk.complete_task,id=12060,text=1206032,},
 },
--task 12061 accept_talk
 [33]=
 {
  [1]={tp=tk.text,text=1206121,},
  [2]={tp=tk.page,id=34,text=1206122,},
 },
 [34]=
 {
  [1]={tp=tk.text,text=1206123,},
  [2]={tp=tk.page,id=35,text=1206124,},
 },
 [35]=
 {
  [1]={tp=tk.text,text=1206125,},
  [2]={tp=tk.accept_task,id=12061,text=1206126,},
 },
--task 12061 complete_talk
 [36]=
 {
  [1]={tp=tk.text,text=1206131,},
  [2]={tp=tk.complete_task,id=12061,text=1206132,},
 },
--task 12062 accept_talk
 [37]=
 {
  [1]={tp=tk.text,text=1206221,},
  [2]={tp=tk.page,id=38,text=1206222,},
 },
 [38]=
 {
  [1]={tp=tk.text,text=1206223,},
  [2]={tp=tk.accept_task,id=12062,text=1206224,},
 },
--task 12065 complete_talk
 [39]=
 {
  [1]={tp=tk.text,text=1206531,},
  [2]={tp=tk.complete_task,id=12065,text=1206532,},
 },
--task 12066 accept_talk
 [40]=
 {
  [1]={tp=tk.text,text=1206621,},
  [2]={tp=tk.page,id=41,text=1206622,},
 },
 [41]=
 {
  [1]={tp=tk.text,text=1206623,},
  [2]={tp=tk.accept_task,id=12066,text=1206624,},
 },
--task 12070 complete_talk
 [42]=
 {
  [1]={tp=tk.text,text=1207031,},
  [2]={tp=tk.complete_task,id=12070,text=1207032,},
 },
--task 12071 accept_talk
 [43]=
 {
  [1]={tp=tk.text,text=1207121,},
  [2]={tp=tk.page,id=44,text=1207122,},
 },
 [44]=
 {
  [1]={tp=tk.text,text=1207123,},
  [2]={tp=tk.accept_task,id=12071,text=1207124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]