--单个npc对话:npc_10121002.lua
local npc_id=10121002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100211,},
  [2]={tp=tk.accept_check,id={11008,11028},},
  [3]={tp=tk.complete_check,id={11007,11027},},
  [4]={tp=tk.close,text=1,},
 },
--task 11007 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1100731,},
  [2]={tp=tk.complete_task,id=11007,text=1100732,},
 },
--task 11008 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1100821,},
  [2]={tp=tk.page,id=4,text=1100822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1100823,},
  [2]={tp=tk.page,id=5,text=1100824,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1100825,},
  [2]={tp=tk.accept_task,id=11008,text=1100826,},
 },
--task 11027 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1102731,},
  [2]={tp=tk.complete_task,id=11027,text=1102732,},
 },
--task 11028 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1102821,},
  [2]={tp=tk.page,id=8,text=1102822}
 },
 [8]=
 {
  [1]={tp=tk.text,text=1102823,},
  [2]={tp=tk.accept_task,id=11028,text=1102824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]