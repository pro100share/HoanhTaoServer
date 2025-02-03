--单个npc对话:npc_10121015.lua
local npc_id=10121015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101511,},
  [2]={tp=tk.accept_check,id={11038,11040},},
  [3]={tp=tk.complete_check,id={11037,11039},},
  [4]={tp=tk.close,text=1,},
 },
--task 11037 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1103731,},
  [2]={tp=tk.complete_task,id=11037,text=1103732,},
 },
--task 11038 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1103821,},
  [2]={tp=tk.page,id=4,text=1103822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1103823,},
  [2]={tp=tk.accept_task,id=11038,text=1103824,},
 },
--task 11039 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1103931,},
  [2]={tp=tk.complete_task,id=11039,text=1103932,},
 },
--task 11040 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1104021,},
  [2]={tp=tk.page,id=7,text=1104022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1104023,},
  [2]={tp=tk.accept_task,id=11040,text=1104024,},
 }, 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]