--单个npc对话:npc_10011022.lua
local npc_id=10011022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001102211,},
  [2]={tp=tk.accept_check,id={1003},},
  [3]={tp=tk.complete_check,id={1002},},
  [8]={tp=tk.close,text=1,},
 },
--task 1002 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=100231,},
  [2]={tp=tk.complete_task,id=1002,text=100232,},
 },
--task 1003 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=100321,},
  [2]={tp=tk.page,id=4,text=100322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=100323,},
  [2]={tp=tk.accept_task,id=1003,text=100324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]