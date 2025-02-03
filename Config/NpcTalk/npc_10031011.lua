--单个npc对话:npc_10031011.lua
local npc_id=10031011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003101111,},
  [2]={tp=tk.accept_check,id={2026,2027},},
  [3]={tp=tk.complete_check,id={2025,2026},},
  [4]={tp=tk.close,text=1,},
 },
--task 2025 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=202531,},
  [2]={tp=tk.complete_task,id=2025,text=202532,},
 },
--task 2026 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=202621,},
  [2]={tp=tk.page,id=4,text=202622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=202623,},
  [2]={tp=tk.page,id=5,text=202624,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=202625,},
  [2]={tp=tk.accept_task,id=2026,text=202626,},
 },
--task 2026 uncomplete_talk
 [6]=
 {
  [1]={tp=tk.text,text=202627,},
  [2]={tp=tk.enter_dupl,dupl_id=1002,map_id=5002,text=666,},
 },
--task 2026 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=202631,},
  [2]={tp=tk.complete_task,id=2026,text=202632,},
 },
--task 2027 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=202721,},
  [2]={tp=tk.page,id=9,text=202722,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=202723,},
  [2]={tp=tk.accept_task,id=2027,text=202724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 