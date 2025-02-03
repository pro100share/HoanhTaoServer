--单个npc对话:npc_10111021.lua
local npc_id=10111021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011102111,},
  [2]={tp=tk.accept_check,id={10202,10203},},
  [3]={tp=tk.complete_check,id={10202,10203},},
  [8]={tp=tk.close,text=1,},
 },
--task 10202 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1020221,},
  [2]={tp=tk.accept_task,id=10202,text=1020222,},
 },
--task 10202 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1020231,},
  [2]={tp=tk.complete_task,id=10202,text=1020232,},
 },
--task 10203 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=1020321,},
  [2]={tp=tk.accept_task,id=10203,text=1020322,},
 },
--task 10203 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1020331,},
  [2]={tp=tk.complete_task,id=10203,text=1020332,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]