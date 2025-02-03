--单个npc对话:npc_10011033.lua
local npc_id=10011033
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100111,},
  [2]={tp=tk.accept_check,id={1007,1008},},
  [3]={tp=tk.complete_check,id={1006,1007},},
  [4]={tp=tk.close,text=1,},
 },
--task 1006 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=100631,},
  [2]={tp=tk.complete_task,id=1006,text=100632,},
 },
--task 1007 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=100721,},
  [2]={tp=tk.page,id=7,text=100722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=100723,},
  [2]={tp=tk.accept_task,id=1007,text=100724,},
 },
--task 1007 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=100731,},
  [2]={tp=tk.complete_task,id=1007,text=100732,},
 },
--task 1008 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=100821,},
  [2]={tp=tk.page,id=10,text=100822,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=100823,},
  [2]={tp=tk.accept_task,id=1008,text=100824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]