--单个npc对话:npc_10131204.lua
local npc_id=10131204
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013120411,}, 
  [2]={tp=tk.accept_check,id={12206},},
  [3]={tp=tk.complete_check,id={12206},},
  [4]={tp=tk.close,text=1,},
 }, 
--task 12206 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1220621,},
  [2]={tp=tk.accept_task,id=12206,text=1220622,},
 },
--task 12206 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1220631,},
  [2]={tp=tk.complete_task,id=12206,text=1220632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 