--单个npc对话:npc_10121018.lua
local npc_id=10121018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101811,},
  [2]={tp=tk.accept_check,id={11048},},
  [3]={tp=tk.complete_check,id={11047},},
  [4]={tp=tk.close,text=1,},
 },
--task 11047 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1104731,},
  [2]={tp=tk.complete_task,id=11047,text=1104732,},
 },
--task 11048 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1104821,},
  [2]={tp=tk.accept_task,id=11048,text=1104822,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]