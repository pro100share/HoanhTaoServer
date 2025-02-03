--单个npc对话:npc_80251017.lua
local npc_id=80251017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100411,},
  [2]={tp=tk.accept_check,id={802508},},
  [3]={tp=tk.complete_check,id={802508},},
  [4]={tp=tk.close,text=1,},
 },
--task 802508 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250821,},
  [2]={tp=tk.accept_task,id=802508,text=80250822,},
 },
--task 802508 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250831,},
  [2]={tp=tk.complete_task,id=802508,text=80250832,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]