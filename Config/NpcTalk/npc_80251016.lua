--单个npc对话:npc_80251016.lua
local npc_id=80251016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100411,},
  [2]={tp=tk.accept_check,id={802507},},
  [3]={tp=tk.complete_check,id={802507},},
  [4]={tp=tk.close,text=1,},
 },
--task 802507 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250721,},
  [2]={tp=tk.accept_task,id=802507,text=80250722,},
 },
--task 802507 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250731,},
  [2]={tp=tk.complete_task,id=802507,text=80250732,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]