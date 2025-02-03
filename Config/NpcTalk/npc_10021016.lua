--单个npc对话:npc_10021016.lua
local npc_id=10021016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101611,},
  [2]={tp=tk.accept_check,id={2127,2128,2129,2130,2131,2132,2133},},
  [3]={tp=tk.complete_check,id={2127,2128,2129,2130,2131,2132,2133},},
  [4]={tp=tk.close,text=1,},
 },
--task 2127 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=212721,},
  [2]={tp=tk.page,id=3,text=212722,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=212723,},
  [2]={tp=tk.page,id=4,text=212724,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=212725,},
  [2]={tp=tk.accept_task,id=2127,text=212726,},
 },
--task 2127 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=212731,},
  [2]={tp=tk.complete_task,id=2127,text=212732,},
 },
--task 2128 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=212821,},
  [2]={tp=tk.page,id=7,text=212822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=212823,},
  [2]={tp=tk.page,id=8,text=212824,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=212825,},
  [2]={tp=tk.accept_task,id=2128,text=212826,},
 },
--task 2128 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=212831,},
  [2]={tp=tk.complete_task,id=2128,text=212832,},
 },
--task 2129 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=212921,},
  [2]={tp=tk.page,id=11,text=212922,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=212923,},
  [2]={tp=tk.accept_task,id=2129,text=212924,},
 },
--task 2129 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=212931,},
  [2]={tp=tk.complete_task,id=2129,text=212932,},
 },
--task 2130 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=213021,},
  [2]={tp=tk.page,id=14,text=213022,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=213023,},
  [2]={tp=tk.page,id=15,text=213024,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=213025,},
  [2]={tp=tk.page,id=16,text=213026,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=213027,},
  [2]={tp=tk.accept_task,id=2130,text=213028,},
 },
--task 2130 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=213031,},
  [2]={tp=tk.complete_task,id=2130,text=213032,},
 },
--task 2131 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=213121,},
  [2]={tp=tk.page,id=19,text=213122,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=213123,},
  [2]={tp=tk.accept_task,id=2131,text=213124,},
 },
--task 2131 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=213131,},
  [2]={tp=tk.complete_task,id=2131,text=213132,},
 },
--task 2132 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=213221,},
  [2]={tp=tk.page,id=22,text=213222,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=213223,},
  [2]={tp=tk.page,id=23,text=213224,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=213225,},
  [2]={tp=tk.accept_task,id=2132,text=213226,},
 },
--task 2132 complete_talk
 [24]=
 {
  [1]={tp=tk.text,text=213231,},
  [2]={tp=tk.page,id=25,text=213232,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=213233,},
  [2]={tp=tk.complete_task,id=2132,text=213234,},
 },
--task 2133 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=213321,},
  [2]={tp=tk.page,id=27,text=213322,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=213323,},
  [2]={tp=tk.page,id=28,text=213324,},
 },
 [28]=
 {
  [1]={tp=tk.text,text=213325,},
  [2]={tp=tk.accept_task,id=2133,text=213326,},
 },
--task 2133 complete_talk
 [29]=
 {
  [1]={tp=tk.text,text=213331,},
  [2]={tp=tk.complete_task,id=2133,text=213332,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 