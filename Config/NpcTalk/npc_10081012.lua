--单个npc对话:npc_10081012.lua
local npc_id=10081012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101211,},
  [2]={tp=tk.accept_check,id={8008},},
  [3]={tp=tk.complete_check,id={8007},},
  [4]={tp=tk.close,text=1,},
 },
--task 8007 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=800731,},
  [2]={tp=tk.complete_task,id=8007,text=800732,},
 },
--task 8008 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=800821,},
  [2]={tp=tk.page,id=4,text=800822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=800823,},
  [2]={tp=tk.accept_task,id=8008,text=800824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]