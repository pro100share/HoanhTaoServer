--单个npc对话:npc_10081011.lua
local npc_id=10081011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101111,},
  [2]={tp=tk.accept_check,id={8030},},
  [3]={tp=tk.complete_check,id={8029},},
  [4]={tp=tk.close,text=1,},
 },
--task 8029 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=802931,},
  [2]={tp=tk.complete_task,id=8029,text=802932,},
 },
--task 8030 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=803021,},
  [2]={tp=tk.page,id=4,text=803022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=803023,},
  [2]={tp=tk.accept_task,id=8030,text=803024,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]