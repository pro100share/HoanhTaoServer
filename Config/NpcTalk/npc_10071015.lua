--单个npc对话:npc_10071015.lua
local npc_id=10071015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101511,},
  [2]={tp=tk.accept_check,id={6002,6003,6007},},
  [3]={tp=tk.complete_check,id={6001,6002,6006},},
  [4]={tp=tk.close,text=1,},
 },
--task 6001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=600131,},
  [2]={tp=tk.complete_task,id=6001,text=600132,},
 },
--task 6002 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=600221,},
  [2]={tp=tk.page,id=4,text=600222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=600223,},
  [2]={tp=tk.page,id=5,text=600224,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=600225,},
  [2]={tp=tk.accept_task,id=6002,text=600226,},
 },
--task 6002 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=600231,},
  [2]={tp=tk.complete_task,id=6002,text=600232,},
 },
--task 6003 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=600321,},
  [2]={tp=tk.page,id=8,text=600322,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=600323,},
  [2]={tp=tk.accept_task,id=6003,text=600324,},
 },
--task 6006 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=600631,},
  [2]={tp=tk.complete_task,id=6006,text=600632,},
 },
--task 6007 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=600721,},
  [2]={tp=tk.page,id=11,text=600722,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=600723,},
  [2]={tp=tk.accept_task,id=6007,text=600724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  