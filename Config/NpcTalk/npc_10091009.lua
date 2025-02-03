--单个npc对话:npc_10091009.lua
local npc_id=10091009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100911,},
  [2]={tp=tk.accept_check,id={7041,7042,7043,7044,7045,7055,7056,7057},},
  [3]={tp=tk.complete_check,id={7040,7041,7042,7043,7044,7054,7055,7056},},
  [4]={tp=tk.close,text=1,},
 },
--task 7040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=704031,},
  [2]={tp=tk.complete_task,id=7040,text=704032,},
 },
--task 7041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=704121,},
  [2]={tp=tk.page,id=4,text=704122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=704123,},
  [2]={tp=tk.page,id=26,text=704124,},
 },
 [26]=
 {
  [1]={tp=tk.text,text=704125,},
  [2]={tp=tk.accept_task,id=7041,text=704126,},
 },
--task 7041 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=704131,},
  [2]={tp=tk.complete_task,id=7041,text=704132,},
 },
--task 7042 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=704221,},
  [2]={tp=tk.page,id=7,text=704222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=704223,},
  [2]={tp=tk.accept_task,id=7042,text=704224,},
 },
--task 7042 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=704231,},
  [2]={tp=tk.complete_task,id=7042,text=704232,},
 },
--task 7043 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=704321,},
  [2]={tp=tk.page,id=10,text=704322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=704323,},
  [2]={tp=tk.accept_task,id=7043,text=704324,},
 },
--task 7043 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=704331,},
  [2]={tp=tk.complete_task,id=7043,text=704332,},
 },
--task 7044 accept_talk 
 [12]=
 {
  [1]={tp=tk.text,text=704421,},
  [2]={tp=tk.page,id=13,text=704422,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=704423,},
  [2]={tp=tk.accept_task,id=7044,text=704424,},
 },
--task 7044 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=704431,},
  [2]={tp=tk.complete_task,id=7044,text=704432,},
 },
--task 7045 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=704521,},
  [2]={tp=tk.accept_task,id=7045,text=704522,},
 },
--task 7054 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=705431,},
  [2]={tp=tk.complete_task,id=7054,text=705432,},
 },
--task 7055 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=705521,},
  [2]={tp=tk.page,id=19,text=705522,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=705523,},
  [2]={tp=tk.accept_task,id=7055,text=705524,},
 },
--task 7055 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=705531,},
  [2]={tp=tk.complete_task,id=7055,text=705532,},
 },
--task 7056 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=705621,},
  [2]={tp=tk.accept_task,id=7056,text=705622,},
 },
--task 7056 complete_talk
 [23]=
 {
  [1]={tp=tk.text,text=705631,},
  [2]={tp=tk.complete_task,id=7056,text=705632,},
 },
--task 7057 accept_talk
 [24]=
 {
  [1]={tp=tk.text,text=705721,},
  [2]={tp=tk.page,id=25,text=705722,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=705723,},
  [2]={tp=tk.accept_task,id=7057,text=705724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]