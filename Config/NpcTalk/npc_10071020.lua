--单个npc对话:npc_10071020.lua
local npc_id=10071020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007102011,},
  [2]={tp=tk.accept_check,id={6037},},
  [3]={tp=tk.complete_check,id={6036},},
  [4]={tp=tk.close,text=1,},
 },
--task 6036 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=603631,},
  [2]={tp=tk.complete_task,id=6036,text=603632,},
 },
--task 6037 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=603721,},
  [2]={tp=tk.page,id=4,text=603722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=603723,},
  [2]={tp=tk.accept_task,id=6037,text=603724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  