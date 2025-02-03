--单个npc对话:npc_10011013.lua
local npc_id=10011013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001101311,},
  [2]={tp=tk.accept_check,id={1016},},
  [3]={tp=tk.complete_check,id={1015},},
  [8]={tp=tk.close,text=1,},
 },
--task 1015 complete_talk 
 [2]=
 {
  [1]={tp=tk.text,text=101531,},
  [2]={tp=tk.complete_task,id=1015,text=101532,},
 },
--task 1016 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=101621,},
  [2]={tp=tk.page,id=4,text=101622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101623,},
  [2]={tp=tk.accept_task,id=1016,text=101624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]