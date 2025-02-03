--单个npc对话:npc_10061020.lua
local npc_id=10061020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006102011,},
  [2]={tp=tk.accept_check,id={5041},},
  [3]={tp=tk.complete_check,id={5040},},
  [8]={tp=tk.close,text=1,},
 },
--task 5040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=504031,},
  [2]={tp=tk.complete_task,id=5040,text=504032,},
 },
--task 5041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=504121,},
  [2]={tp=tk.page,id=4,text=504122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=504123,},
  [2]={tp=tk.accept_task,id=5041,text=504124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]