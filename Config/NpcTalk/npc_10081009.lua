--单个npc对话:npc_10081009.lua
local npc_id=10081009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100911,},
  [2]={tp=tk.accept_check,id={8009,8010,8034,8035,8040,8041,8044,8045,8049,8054,8059,8070},},
  [3]={tp=tk.complete_check,id={8008,8009,8033,8034,8039,8040,8043,8044,8048,8053,8058,8069},},
  [4]={tp=tk.close,text=1,},
 },
--task 8008 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=800831,},
  [2]={tp=tk.complete_task,id=8008,text=800832,},
 },
--task 8009 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=800921,},
  [2]={tp=tk.page,id=4,text=800922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=800923,},
  [2]={tp=tk.accept_task,id=8009,text=800924,},
 },
--task 8009 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=800931,},
  [2]={tp=tk.complete_task,id=8009,text=800932,},
 },
--task 8010 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=801021,},
  [2]={tp=tk.page,id=7,text=801022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=801023,},
  [2]={tp=tk.accept_task,id=8010,text=801024,},
 },
--task 8033 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=803331,},
  [2]={tp=tk.complete_task,id=8033,text=803332,},
 },
--task 8034 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=803421,},
  [2]={tp=tk.page,id=10,text=803422,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=803423,},
  [2]={tp=tk.page,id=11,text=803424,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=803425,},
  [2]={tp=tk.accept_task,id=8034,text=803426,},
 },
--task 8034 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=803431,},
  [2]={tp=tk.complete_task,id=8034,text=803432,},
 },
--task 8035 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=803521,},
  [2]={tp=tk.page,id=14,text=803522,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=803523,},
  [2]={tp=tk.page,id=15,text=803524,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=803525,},
  [2]={tp=tk.accept_task,id=8035,text=803526,},
 },
--task 8039 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=803931,},
  [2]={tp=tk.complete_task,id=8039,text=803932,},
 },
--task 8040 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=804021,},
  [2]={tp=tk.page,id=18,text=804022,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=804023,},
  [2]={tp=tk.accept_task,id=8040,text=804024,},
 },
--task 8040 complete_talk
 [19]=
 {
  [1]={tp=tk.text,text=804031,},
  [2]={tp=tk.complete_task,id=8040,text=804032,},
 },
--task 8041 accept_talk
 [20]=
 { 
  [1]={tp=tk.text,text=804121,},
  [2]={tp=tk.page,id=21,text=804122,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=804123,},
  [2]={tp=tk.accept_task,id=8041,text=804124,},
 },
--task 8043 complete_talk
 [22]=
 {
  [1]={tp=tk.text,text=804331,},
  [2]={tp=tk.complete_task,id=8043,text=804332,},
 },
--task 8044 accept_talk
 [23]=
 {
  [1]={tp=tk.text,text=804421,},
  [2]={tp=tk.page,id=24,text=804422,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=804423,},
  [2]={tp=tk.accept_task,id=8044,text=804424,},
 },
--task 8044 complete_talk 
 [25]=
 {
  [1]={tp=tk.text,text=804431,},
  [2]={tp=tk.complete_task,id=8044,text=804432,},
 },
--task 8045 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=804521,},
  [2]={tp=tk.page,id=27,text=804522,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=804523,},
  [2]={tp=tk.accept_task,id=8045,text=804524,},
 },
--task 8048 complete_talk
 [28]=
 {
  [1]={tp=tk.text,text=804831,},
  [2]={tp=tk.complete_task,id=8048,text=804832,},
 },
--task 8049 accept_talk
 [29]=
 {
  [1]={tp=tk.text,text=804921,},
  [2]={tp=tk.page,id=30,text=804922,},
 },
 [30]=
 {
  [1]={tp=tk.text,text=804923,},
  [2]={tp=tk.page,id=39,text=804924,}
 },
 [39]=
 {
  [1]={tp=tk.text,text=804925,},
  [2]={tp=tk.accept_task,id=8049,text=804926,},
 },
--task 8053 complete_talk
 [31]=
 {
  [1]={tp=tk.text,text=805331,},
  [2]={tp=tk.complete_task,id=8053,text=805332,},
 },
--task 8054 accept_talk
 [32]=
 {
  [1]={tp=tk.text,text=805421,},
  [2]={tp=tk.page,id=33,text=805422,},
 },
 [33]=
 {
  [1]={tp=tk.text,text=805423,},
  [2]={tp=tk.accept_task,id=8054,text=805424,},
 },
--task 8058 complete_talk
 [34]=
 {
  [1]={tp=tk.text,text=805831,},
  [2]={tp=tk.complete_task,id=8058,text=805832,},
 },
--task 8059 accept_talk
 [35]=
 {
  [1]={tp=tk.text,text=805921,},
  [2]={tp=tk.page,id=36,text=805922,},
 },
 [36]=
 {
  [1]={tp=tk.text,text=805923,},
  [2]={tp=tk.page,id=37,text=805924,},
 },
 [37]=
 {
  [1]={tp=tk.text,text=805925,},
  [2]={tp=tk.accept_task,id=8059,text=805926,},
 },
--task 8069 complete_talk
 [38]=
 {
  [1]={tp=tk.text,text=806931,},
  [2]={tp=tk.complete_task,id=8069,text=806932,},
 },
--task 8070 accept_talk
 [40]=
 {
  [1]={tp=tk.text,text=807021,},
  [2]={tp=tk.page,id=41,text=807022,},
 },
 [41]=
 {
  [1]={tp=tk.text,text=807023,},
  [2]={tp=tk.page,id=42,text=807024,},
 },
 [42]=
 {
  [1]={tp=tk.text,text=807025,},
  [2]={tp=tk.accept_task,id=8070,text=807026,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]