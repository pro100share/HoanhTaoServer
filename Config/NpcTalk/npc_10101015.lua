--单个npc对话:npc_10101015.lua
local npc_id=10101015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101511,},
  [2]={tp=tk.accept_check,id={9053},},
  [3]={tp=tk.complete_check,id={9052},},
  [8]={tp=tk.close,text=1,},
 },
--task 9052 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=905231,},
  [2]={tp=tk.complete_task,id=9052,text=905232,},
 },
--task 9053 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=905321,},
  [2]={tp=tk.accept_task,id=9053,text=905322,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]