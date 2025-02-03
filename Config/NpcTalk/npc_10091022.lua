--单个npc对话:npc_10091022.lua
local npc_id=10091022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102211,},
  [2]={tp=tk.accept_check,id={7053},},
  [3]={tp=tk.complete_check,id={7052},},
  [4]={tp=tk.close,text=1,},
 },
--task 7052 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=705231,},
  [2]={tp=tk.complete_task,id=7052,text=705232,},
 },
--task 7053 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=705321,},
  [2]={tp=tk.accept_task,id=7053,text=705322,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]