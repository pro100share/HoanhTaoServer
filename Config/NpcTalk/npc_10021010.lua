--单个npc对话:npc_10021010.lua
local npc_id=10021010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101011,},
  [2]={tp=tk.accept_check,id={2008},},
  [3]={tp=tk.complete_check,id={2005},},
  [4]={tp=tk.storage,text=13,},
  [8]={tp=tk.close,text=1,},
 },
--task 2005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=200731,},
  [2]={tp=tk.complete_task,id=2005,text=200732,},
 },
--task 2008 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200821,},
  [2]={tp=tk.page,id=4,text=200822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=200823,},
  [2]={tp=tk.page,id=5,text=200824,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=200825,},
  [2]={tp=tk.accept_task,id=2008,text=200826,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]