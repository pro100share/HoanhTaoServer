--单个npc对话:npc_1001.lua
local npc_id=1001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=100111,},
  [2]={tp=tk.accept_check,id={1001,1002,1011,1012,1013,1017,1018,1020,1021,1022,1023,1024,1025,},},
  [3]={tp=tk.complete_check,id={1001,1010,1011,1012,1016,1017,1019,1020,1021,1022,1023,1024,},},
  [10]={tp=tk.find_npc,id={1001,1002,1011,1012,1013,1017,1018,1020,1021,1022,1023,1024,1025,},},
  [4]={tp=tk.shop,id=10000,text=7,},
  [5]={tp=tk.fun,fun="zcs",param={"zcs",123,321},text="zcs",},
  [8]={tp=tk.close,text=1,},
 },
--task 1001 accept_talk 
 [99]=
 {
  [1]={tp=tk.text,text=100121},
  [2]={tp=tk.accept_task,id=1001,text=100122},
 },
--task 1001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=100131,},
  [2]={tp=tk.page,id=3,text=100132,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=100133,},
  [2]={tp=tk.complete_task,id=1001,text=100134,},
 },
--task 1002 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=100221,},
  [2]={tp=tk.page,id=5,text=100222,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=100223,},
  [2]={tp=tk.page,id=6,text=100224,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=100225,},
  [2]={tp=tk.accept_task,id=1002,text=100226,}
 },
--task 1010 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=101031,},
  [2]={tp=tk.complete_task,id=1010,text=101032,},
 },
--task 1011 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=101121,},
  [2]={tp=tk.page,id=9,text=101122,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=101123,},
  [2]={tp=tk.accept_task,id=1011,text=101124,},
 },
--task 1011 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=101131,},
  [2]={tp=tk.complete_task,id=1011,text=101132,},
 },
--task 1012 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=101221,},
  [2]={tp=tk.accept_task,id=1012,text=101222,},
 },
--task 1012 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=101231,},
  [2]={tp=tk.complete_task,id=1012,text=101232,},
 },
--task 1013 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=101321,},
  [2]={tp=tk.page,id=14,text=101322,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=101323,},
  [2]={tp=tk.accept_task,id=1013,text=101324,},
 },
--task 1016 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=101631,},
  [2]={tp=tk.complete_task,id=1016,text=101632,},
 },
--task 1017 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=101721,},
  [2]={tp=tk.page,id=17,text=101722,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=101723,},
  [2]={tp=tk.accept_task,id=1017,text=101724,},
 },
--task 1017 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=101731,},
  [2]={tp=tk.complete_task,id=1017,text=101732,},
 },
--task 1018 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=101821,},
  [2]={tp=tk.page,id=20,text=101822,},
 },
 [20]=
 { 
  [1]={tp=tk.text,text=101823,},
  [2]={tp=tk.page,id=21,text=101824,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=101825,},
  [2]={tp=tk.accept_task,id=1018,text=101826,},
 },
--task 1019 complete_talk
 [22]=
 {
  [1]={tp=tk.text,text=101931,},
  [2]={tp=tk.complete_task,id=1019,text=101932,},
 },
--task 1020 accept_talk
 [23]=
 {
  [1]={tp=tk.text,text=102021,},
  [2]={tp=tk.page,id=24,text=102022,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=102023,},
  [2]={tp=tk.accept_task,id=1020,text=102024,},
 },
--task 1020 complete_talk
 [25]=
 {
  [1]={tp=tk.text,text=102031,},
  [2]={tp=tk.complete_task,id=1020,text=102032,},
 },
--task 1021 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=102121,},
  [2]={tp=tk.accept_task,id=1021,text=102122,},
 },
--task 1021 complete_talk
 [27]=
 {
  [1]={tp=tk.text,text=102131,},
  [2]={tp=tk.complete_task,id=1021,text=102132,},
 },
--task 1022 accept_talk
 [28]=
 {
  [1]={tp=tk.text,text=102221,},
  [2]={tp=tk.page,id=29,text=102222,},
 },
 [29]=
 {
  [1]={tp=tk.text,text=102223,},
  [2]={tp=tk.page,id=30,text=102224,},
 },
 [30]=
 {
  [1]={tp=tk.text,text=102225,},
  [2]={tp=tk.accept_task,id=1022,text=102226,},
 },
--task 1022 complete_talk
 [31]=
 {
  [1]={tp=tk.text,text=102231,},
  [2]={tp=tk.complete_task,id=1022,text=102232,},
 },
--task 1023 accept_talk
 [32]=
 {
  [1]={tp=tk.text,text=102321,},
  [2]={tp=tk.accept_task,id=1023,text=102322,},
 },
--task 1023 complete_talk
 [33]=
 {
  [1]={tp=tk.text,text=102331,},
  [2]={tp=tk.complete_task,id=1023,text=102332,},
 },
--task 1024 accept_talk
 [34]=
 {
  [1]={tp=tk.text,text=102421,},
  [2]={tp=tk.page,id=35,text=102422,},
 },
 [35]=
 {
  [1]={tp=tk.text,text=102423,},
  [2]={tp=tk.accept_task,id=1024,text=102424,},
 },
--task 1024 complete_talk
 [36]=
 {
  [1]={tp=tk.text,text=102431,},
  [2]={tp=tk.complete_task,id=1024,text=102432,},
 },
--task 1025 accept_talk
 [37]=
 {
  [1]={tp=tk.text,text=102521,},
  [2]={tp=tk.page,id=38,text=102522,},
 },
 [38]=
 {
  [1]={tp=tk.text,text=102523,},
  [2]={tp=tk.accept_task,id=1025,text=102524,},
 },
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
-------------------------------------------------------
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]