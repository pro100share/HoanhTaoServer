--单个npc对话:npc_80251015.lua
local npc_id=80251015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100411,},
  [2]={tp=tk.accept_check,id={802506},},
  [3]={tp=tk.complete_check,id={802506},},
  [4]={tp=tk.close,text=1,},
 },
--task 802506 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250621,},
  [2]={tp=tk.accept_task,id=802506,text=80250622,},
 },
--task 802506 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250631,},
  [2]={tp=tk.complete_task,id=802506,text=80250632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]