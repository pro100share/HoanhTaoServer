--单个npc对话:npc_10111022.lua
local npc_id=10111022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011102211,},
  [2]={tp=tk.accept_check,id={10206},},
  [3]={tp=tk.complete_check,id={10206},},
  [8]={tp=tk.close,text=1,},
 },
--task 10206 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1020621,},
  [2]={tp=tk.accept_task,id=10206,text=1020622,},
 },
--task 10206 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1020631,},
  [2]={tp=tk.complete_task,id=10206,text=1020632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]