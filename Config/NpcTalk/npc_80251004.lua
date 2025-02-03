--单个npc对话:npc_80251004.lua
local npc_id=80251004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100411,},
  [2]={tp=tk.accept_check,id={802505},},
  [3]={tp=tk.complete_check,id={802505},},
  [4]={tp=tk.close,text=1,},
 },
--task 802505 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250521,},
  [2]={tp=tk.accept_task,id=802505,text=80250522,},
 },
--task 802505 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250531,},
  [2]={tp=tk.complete_task,id=802505,text=80250532,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]