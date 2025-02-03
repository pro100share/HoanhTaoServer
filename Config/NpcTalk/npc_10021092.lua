--单个npc对话:npc_10021092.lua
local npc_id=10021092
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002109211,},
  [2]={tp=tk.accept_check,id={20101},},
  [3]={tp=tk.complete_check,id={20101},},
  [8]={tp=tk.close,text=1,},
 },
--task 20101 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=2010121,},
  [2]={tp=tk.accept_task,id=20101,text=2010122,},
 },
--task 20101 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=2010131,},
  [2]={tp=tk.complete_task,id=20101,text=2010132,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]