--单个npc对话:npc_10111001.lua
local npc_id=10111001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100111,},
  [2]={tp=tk.accept_check,id={10001,10003,10005,10037,10042,10050},},
  [3]={tp=tk.complete_check,id={9070,10002,10004,10036,10041,10049},},
  [4]={tp=tk.close,text=1,},
 },
--task 9070 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=907031,},
  [2]={tp=tk.complete_task,id=9070,text=907032,},
 },
--task 10001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1000121,},
  [2]={tp=tk.page,id=4,text=1000122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1000123,},
  [2]={tp=tk.accept_task,id=10001,text=1000124,},
 },
--task 10002 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1000231,},
  [2]={tp=tk.complete_task,id=10002,text=1000232,},
 },
--task 10003 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1000321,},
  [2]={tp=tk.accept_task,id=10003,text=1000322,},
 },
--task 10004 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1000431,},
  [2]={tp=tk.complete_task,id=10004,text=1000432,},
 },
--task 10005 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1000521,},
  [2]={tp=tk.page,id=9,text=1000522,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1000523,},
  [2]={tp=tk.accept_task,id=10005,text=1000524,},
 },
--task 10036 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=1003631,},
  [2]={tp=tk.complete_task,id=10036,text=1003632,},
 },
--task 10037 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=1003721,},
  [2]={tp=tk.page,id=12,text=1003722,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1003723,},
  [2]={tp=tk.accept_task,id=10037,text=1003724,},
 },
--task 10041 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1004131,},
  [2]={tp=tk.complete_task,id=10041,text=1004132,},
 },
--task 10042 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1004221,},
  [2]={tp=tk.page,id=15,text=1004222,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1004223,},
  [2]={tp=tk.accept_task,id=10042,text=1004224,},
 },
--task 10049 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=1004931,},
  [2]={tp=tk.complete_task,id=10049,text=1004932,},
 },
--task 10050 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=1005021,},
  [2]={tp=tk.page,id=18,text=1005022,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=1005023,},
  [2]={tp=tk.accept_task,id=10050,text=1005024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]