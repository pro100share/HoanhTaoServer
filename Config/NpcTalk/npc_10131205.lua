--单个npc对话:npc_10131205.lua
local npc_id=10131205
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013120511,}, 
  [2]={tp=tk.accept_check,id={12207},},
  [3]={tp=tk.complete_check,id={12207},},
  [4]={tp=tk.close,text=1,},
 }, 
--task 12207 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=1220721,},
  [2]={tp=tk.accept_task,id=12207,text=1220722,},
 },
--task 12207 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=1220731,},
  [2]={tp=tk.complete_task,id=12207,text=1220732,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 