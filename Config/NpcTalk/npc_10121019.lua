--单个npc对话:npc_10121019.lua
local npc_id=10121019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101911,},
  [2]={tp=tk.accept_check,id={11050},},
  [3]={tp=tk.complete_check,id={11049},},
  [4]={tp=tk.close,text=1,},
 },
--task 11049 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1104931,},
  [2]={tp=tk.complete_task,id=11049,text=1104932,},
 },
--task 11050 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1105021,},
  [2]={tp=tk.page,id=4,text=1105022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1105023,},
  [2]={tp=tk.accept_task,id=11050,text=1105024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]