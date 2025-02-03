--单个npc对话:npc_10121016.lua
local npc_id=10121016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101611,},
  [2]={tp=tk.accept_check,id={11039},},
  [3]={tp=tk.complete_check,id={11038},},
  [4]={tp=tk.close,text=1,},
 },
--task 11038 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1103831,},
  [2]={tp=tk.complete_task,id=11038,text=1103832,},
 },
--task 11039 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1103921,},
  [2]={tp=tk.page,id=4,text=1103922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1103923,},
  [2]={tp=tk.accept_task,id=11039,text=1103924,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]