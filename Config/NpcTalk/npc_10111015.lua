--单个npc对话:npc_10111015.lua
local npc_id=10111015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101511,},
  [2]={tp=tk.accept_check,id={10057,10058,10064,10065},},
  [3]={tp=tk.complete_check,id={10056,10057,10063,10064},},
  [8]={tp=tk.close,text=1,},
 },
--task 10056 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1005631,},
  [2]={tp=tk.complete_task,id=10056,text=1005632,},
 },
--task 10057 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1005721,},
  [2]={tp=tk.page,id=4,text=1005722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1005723,},
  [2]={tp=tk.accept_task,id=10057,text=1005724,},
 },
--task 10057 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1005731,},
  [2]={tp=tk.complete_task,id=10057,text=1005732,},
 },
--task 10058 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1005821,},
  [2]={tp=tk.page,id=7,text=1005822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1005823,},
  [2]={tp=tk.accept_task,id=10058,text=1005824,},
 },
--task 10063 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1006331,},
  [2]={tp=tk.complete_task,id=10063,text=1006332,},
 },
--task 10064 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1006421,},
  [2]={tp=tk.page,id=10,text=1006422,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1006423,},
  [2]={tp=tk.accept_task,id=10064,text=1006424,},
 },
--task 10064 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1006431,},
  [2]={tp=tk.complete_task,id=10064,text=1006432,},
 },
--task 10065 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1006521,},
  [2]={tp=tk.page,id=13,text=1006522,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1006523,},
  [2]={tp=tk.accept_task,id=10065,text=1006524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]