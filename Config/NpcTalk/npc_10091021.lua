--单个npc对话:npc_10091021.lua
local npc_id=10091021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102111,},
  [2]={tp=tk.accept_check,id={7052},},
  [3]={tp=tk.complete_check,id={7051},},
  [4]={tp=tk.close,text=1,},
 },
--task 7051 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=705131,},
  [2]={tp=tk.complete_task,id=7051,text=705132,},
 },
--task 7052 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=705221,},
  [2]={tp=tk.accept_task,id=7052,text=705222,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]