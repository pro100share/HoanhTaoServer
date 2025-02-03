--单个npc对话:npc_10081018.lua
local npc_id=10081018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101811,},
  [2]={tp=tk.accept_check,id={8201,8202},},
  [3]={tp=tk.complete_check,id={8201,8202},},
  [8]={tp=tk.close,text=1,},
 },
--task 8201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=820121,},
  [2]={tp=tk.accept_task,id=8201,text=820122,},
 },
--task 8201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=820131,},
  [2]={tp=tk.complete_task,id=8201,text=820132,},
 },
--task 8202 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=820221,},
  [2]={tp=tk.accept_task,id=8202,text=820222,},
 },
--task 8202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=820231,},
  [2]={tp=tk.complete_task,id=8202,text=820232,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]