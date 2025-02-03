--单个npc对话:npc_10081016.lua
local npc_id=10081016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101611,},
  [2]={tp=tk.accept_check,id={8047},},
  [3]={tp=tk.complete_check,id={8046},},
  [4]={tp=tk.close,text=1,},
 },
--task 8046 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=804631,},
  [2]={tp=tk.complete_task,id=8046,text=804632,},
 },
--task 8047 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=804721,},
  [2]={tp=tk.page,id=4,text=804722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=804723,},
  [2]={tp=tk.accept_task,id=8047,text=804724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]