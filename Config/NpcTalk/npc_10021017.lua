--单个npc对话:npc_10021017.lua
local npc_id=10021017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101711,},
  [2]={tp=tk.accept_check,id={},},
  [3]={tp=tk.complete_check,id={2021},},
  [4]={tp=tk.close,text=1,},
 },
--task 2021 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=202131,},
  [2]={tp=tk.complete_task,id=2021,text=202132,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 