--单个npc对话:npc_10111012.lua
local npc_id=10111012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101211,},
  [2]={tp=tk.accept_check,id={10029},},
  [3]={tp=tk.complete_check,id={10028,10029},},
  [8]={tp=tk.close,text=1,},
 },
--task 10028 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1002831,},
  [2]={tp=tk.complete_task,id=10028,text=1002832,},
 },
--task 10029 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1002921,},
  [2]={tp=tk.page,id=4,text=1002922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1002923,},
  [2]={tp=tk.accept_task,id=10029,text=1002924,},
 },
--task 10029 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1002931,},
  [2]={tp=tk.complete_task,id=10029,text=1002932,},
 },
-- --task 10030 accept_talk
 -- [6]=
 -- {
  -- [1]={tp=tk.text,text=1003021,},
  -- [2]={tp=tk.accept_task,id=10030,text=1003022,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]