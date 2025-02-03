--单个npc对话:npc_10061103.lua
local npc_id=10061103
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006110311,},
  [2]={tp=tk.accept_check,id={5035,5036},},
  [3]={tp=tk.complete_check,id={5034,5035},},
  [8]={tp=tk.close,text=1,},
 },
--task 5034 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=503431,},
  [2]={tp=tk.complete_task,id=5034,text=503432,},
 },
--task 5035 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=503521,},
  [2]={tp=tk.accept_task,id=5035,text=503522,},
 },
--task 5035 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=503531,},
  [2]={tp=tk.complete_task,id=5035,text=503532,},
 },
--task 5036 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=503621,},
  [2]={tp=tk.page,id=6,text=503622,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=503623,},
  [2]={tp=tk.accept_task,id=5036,text=503624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 