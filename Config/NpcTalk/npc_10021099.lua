--单个npc对话:npc_10021099.lua
local npc_id=10021099
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002109911,},
  [2]={tp=tk.accept_check,id={2037},},
  [3]={tp=tk.complete_check,id={2036},},
  [4]={tp=tk.dupl,text=444,},
  [5]={tp=tk.close,text=1,},
 },
--task 2036 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=203631,},
  [2]={tp=tk.complete_task,id=2036,text=203632,},
 },
--task 2037 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=203721,},
  [2]={tp=tk.page,id=4,text=203722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=203723,},
  [2]={tp=tk.accept_task,id=2037,text=203724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 