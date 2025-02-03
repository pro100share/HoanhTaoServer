--单个npc对话:npc_10121003.lua
local npc_id=10121003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100311,},
  [2]={tp=tk.accept_check,id={11004,11005,11007},},
  [3]={tp=tk.complete_check,id={11003,11004,11006},},
  [4]={tp=tk.close,text=1,},
 },
--task 11003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1100331,},
  [2]={tp=tk.complete_task,id=11003,text=1100332,},
 },
--task 11004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1100421,},
  [2]={tp=tk.page,id=4,text=1100422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1100423,},
  [2]={tp=tk.accept_task,id=11004,text=1100424,},
 },
--task 11004 complete_talk 
 [5]=
 {
  [1]={tp=tk.text,text=1100431,},
  [2]={tp=tk.complete_task,id=11004,text=1100432,},
 },
--task 11005 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1100521,},
  [2]={tp=tk.page,id=7,text=1100522,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1100523,},
  [2]={tp=tk.page,id=8,text=1100524,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1100525,},
  [2]={tp=tk.accept_task,id=11005,text=1100526,},
 },
--task 11006 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=1100631,},
  [2]={tp=tk.complete_task,id=11006,text=1100632,},
 },
--task 11007 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=1100721,},
  [2]={tp=tk.accept_task,id=11007,text=1100722,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]