--单个npc对话:npc_10081014.lua
local npc_id=10081014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101411,},
  [2]={tp=tk.accept_check,id={8053},},
  [3]={tp=tk.complete_check,id={8052},},
  [4]={tp=tk.close,text=1,},
 },
--task 8052 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=805231,},
  [2]={tp=tk.complete_task,id=8052,text=805232,},
 },
--task 8053 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=805321,},
  [2]={tp=tk.page,id=4,text=805322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=805323,},
  [2]={tp=tk.accept_task,id=8053,text=805324,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]