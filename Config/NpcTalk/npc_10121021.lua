--单个npc对话:npc_10121021.lua
local npc_id=10121021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102111,},
  [2]={tp=tk.accept_check,id={11060,11061},},
  [3]={tp=tk.complete_check,id={11078,11060},},
  [4]={tp=tk.close,text=1,},
 },
--task 11078 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1107831,},
  [2]={tp=tk.complete_task,id=11078,text=1107832,},
 },
--task 11060 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1106021,},
  [2]={tp=tk.page,id=4,text=1106022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1106023,},
  [2]={tp=tk.accept_task,id=11060,text=1106024,},
 },
--task 11060 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1106031,},
  [2]={tp=tk.complete_task,id=11060,text=1106032,},
 },
--task 11061 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1106121,},
  [2]={tp=tk.page,id=7,text=1106122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1106123,},
  [2]={tp=tk.accept_task,id=11061,text=1106124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]