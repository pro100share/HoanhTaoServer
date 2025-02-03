--单个npc对话:npc_10111025.lua
local npc_id=10111025
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100411,},
  [2]={tp=tk.accept_check,id={10039},},
  [3]={tp=tk.complete_check,id={10038},},
  [8]={tp=tk.close,text=1,},
 },
--task 10038 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1003831,},
  [2]={tp=tk.complete_task,id=10038,text=1003832,},
 },
--task 10039 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1003921,},
  [2]={tp=tk.accept_task,id=10039,text=1003922,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]