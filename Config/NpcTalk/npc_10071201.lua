--单个npc对话:npc_10071201.lua
local npc_id=10071201
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007120111,},
  [2]={tp=tk.accept_check,id={6201},},
  [3]={tp=tk.complete_check,id={6201},},
  [8]={tp=tk.close,text=1,},
 },
--task 6201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=620121,},
  [2]={tp=tk.accept_task,id=6201,text=620122,},
 },
--task 6201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=620131,},
  [2]={tp=tk.complete_task,id=6201,text=620132,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 