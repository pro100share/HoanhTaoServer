--单个npc对话:npc_10121004.lua
local npc_id=10121004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100411,},
  [2]={tp=tk.accept_check,id={11009},},
  [3]={tp=tk.complete_check,id={11008},},
  [4]={tp=tk.close,text=1,},
 },
--task 11008 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1100831,},
  [2]={tp=tk.complete_task,id=11008,text=1100832,},
 },
--task 11009 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1100921,},
  [2]={tp=tk.page,id=4,text=1100922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1100923,},
  [2]={tp=tk.accept_task,id=11009,text=1100924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]