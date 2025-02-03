--单个npc对话:npc_10101007.lua
local npc_id=10101007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100711,},
  [2]={tp=tk.accept_check,id={9018},},
  [3]={tp=tk.complete_check,id={9017},},
  [8]={tp=tk.close,text=1,},
 },
--task 9017 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=901731,},
  [2]={tp=tk.complete_task,id=9017,text=901732,},
 },
--task 9018 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=901821,},
  [2]={tp=tk.page,id=4,text=901822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=901823,},
  [2]={tp=tk.accept_task,id=9018,text=901824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]