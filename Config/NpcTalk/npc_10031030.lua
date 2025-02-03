--单个npc对话:npc_10031030.lua
local npc_id=10031030
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003101111,},
  [2]={tp=tk.accept_check,id={2047},},
  [3]={tp=tk.complete_check,id={2046},},
  [4]={tp=tk.close,text=1,},
 },
--task 2046 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=204631,},
  [2]={tp=tk.complete_task,id=2046,text=204632,},
 },
--task 2047 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=204721,},
  [2]={tp=tk.page,id=12,text=204722,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=204723,},
  [2]={tp=tk.accept_task,id=2047,text=204724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 