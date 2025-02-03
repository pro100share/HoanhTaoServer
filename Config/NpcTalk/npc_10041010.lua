--单个npc对话:npc_10041010.lua
local npc_id=10041010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101011,},
  [2]={tp=tk.accept_check,id={3011},},
  [3]={tp=tk.complete_check,id={3038},},
  [8]={tp=tk.close,text=1,},
 },
--task 3038 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=303831,},
  [2]={tp=tk.complete_task,id=3038,text=303832,},
 },
--task 3011 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=301121,},
  [2]={tp=tk.page,id=4,text=301122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=301123,},
  [2]={tp=tk.accept_task,id=3011,text=301124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 