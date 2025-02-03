--单个npc对话:npc_10121013.lua
local npc_id=10121013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101311,},
  [2]={tp=tk.accept_check,id={11035},},
  [3]={tp=tk.complete_check,id={11034},},
  [4]={tp=tk.close,text=1,},
 },
--task 11034 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1103431,},
  [2]={tp=tk.complete_task,id=11034,text=1103432,},
 },
--task 11035 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1103521,},
  [2]={tp=tk.page,id=4,text=1103522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1103523,},
  [2]={tp=tk.accept_task,id=11035,text=1103524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]