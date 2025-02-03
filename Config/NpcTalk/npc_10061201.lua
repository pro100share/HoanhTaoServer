--单个npc对话:npc_10061201.lua
local npc_id=10061201
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006120111,},
  [2]={tp=tk.accept_check,id={5201,5202},},
  [3]={tp=tk.complete_check,id={5201,5202},},
  [8]={tp=tk.close,text=1,},
 },
--task 5201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=520121,},
  [2]={tp=tk.accept_task,id=5201,text=520122,},
 },
--task 5201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=520131,},
  [2]={tp=tk.complete_task,id=5201,text=520132,},
 },
--task 5202 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=520221,},
  [2]={tp=tk.accept_task,id=5202,text=520222,},
 },
--task 5202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=520231,},
  [2]={tp=tk.complete_task,id=5202,text=520232,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 