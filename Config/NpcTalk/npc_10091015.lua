--单个npc对话:npc_10091015.lua
local npc_id=10091015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009101511,},
  [2]={tp=tk.accept_check,id={7003},},
  [3]={tp=tk.complete_check,id={7002},},
  [4]={tp=tk.close,text=1,},
 },
--task 7002 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=700231,},
  [2]={tp=tk.complete_task,id=7002,text=700232,},
 },
--task 7003 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=700321,},
  [2]={tp=tk.accept_task,id=7003,text=700322,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]