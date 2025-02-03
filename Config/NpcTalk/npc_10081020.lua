--单个npc对话:npc_10081020.lua
local npc_id=10081020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008102011,},
  [2]={tp=tk.accept_check,id={8205,8206},},
  [3]={tp=tk.complete_check,id={8205,8206},},
  [8]={tp=tk.close,text=1,},
 },
--task 8205 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=820521,},
  [2]={tp=tk.accept_task,id=8205,text=820522,},
 },
--task 8205 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=820531,},
  [2]={tp=tk.complete_task,id=8205,text=820532,},
 },
--task 8206 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=820621,},
  [2]={tp=tk.accept_task,id=8206,text=820622,},
 },
--task 8206 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=820631,},
  [2]={tp=tk.complete_task,id=8206,text=820632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]