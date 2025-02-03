--单个npc对话:npc_10051017.lua
local npc_id=10051017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005101711,},
  [2]={tp=tk.accept_check,id={4035,4036},},
  [3]={tp=tk.complete_check,id={4034,4035},},
  [8]={tp=tk.close,text=1,},
 },
--task 4034 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=403431,},
  [2]={tp=tk.complete_task,id=4034,text=403432,},
 },
--task 4035 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=403521,},
  [2]={tp=tk.page,id=4,text=403522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=403523,},
  [2]={tp=tk.accept_task,id=4035,text=403524,},
 },
--task 4035 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=403531,},
  [2]={tp=tk.complete_task,id=4035,text=403532,},
 },
--task 4036 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=403621,},
  [2]={tp=tk.page,id=7,text=403622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=403623,},
  [2]={tp=tk.accept_task,id=4036,text=403624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]