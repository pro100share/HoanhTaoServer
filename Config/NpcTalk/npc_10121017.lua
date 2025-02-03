--单个npc对话:npc_10121017.lua
local npc_id=10121017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101711,},
  [2]={tp=tk.accept_check,id={11041},},
  [3]={tp=tk.complete_check,id={11040},},
  [4]={tp=tk.close,text=1,},
 },
--task 11040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1104031,},
  [2]={tp=tk.complete_task,id=11040,text=1104032,},
 },
--task 11041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1104121,},
  [2]={tp=tk.accept_task,id=11041,text=1104122,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]