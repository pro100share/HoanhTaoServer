--单个npc对话:npc_10091019.lua
local npc_id=10091019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009101911,},
  [2]={tp=tk.accept_check,id={7049,7050},},
  [3]={tp=tk.complete_check,id={7048,7049},},
  [4]={tp=tk.close,text=1,},
 },
--task 7048 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=704831,},
  [2]={tp=tk.complete_task,id=7048,text=704832,},
 },
--task 7049 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=704921,},
  [2]={tp=tk.page,id=4,text=704922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=704923,},
  [2]={tp=tk.page,id=11,text=704924,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=704925,},
  [2]={tp=tk.accept_task,id=7049,text=704926,},
 },
--task 7049 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=704931,},
  [2]={tp=tk.complete_task,id=7049,text=704932,},
 },
--task 7050 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=705021,},
  [2]={tp=tk.page,id=7,text=705022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=705023,},
  [2]={tp=tk.accept_task,id=7050,text=705024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]