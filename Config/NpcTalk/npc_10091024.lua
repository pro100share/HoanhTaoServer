--单个npc对话:npc_10091024.lua
local npc_id=10091024
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102411,},
  [2]={tp=tk.accept_check,id={7201,7202},},
  [3]={tp=tk.complete_check,id={7201,7202},},
  [4]={tp=tk.close,text=1,},
 },
--task 7201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=720121,},
  [2]={tp=tk.accept_task,id=7201,text=720122,},
 },
--task 7201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=720131,},
  [2]={tp=tk.complete_task,id=7201,text=720132,},
 },
--task 7202 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=720221,},
  [2]={tp=tk.accept_task,id=7202,text=720222,},
 },
--task 7202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=720231,},
  [2]={tp=tk.complete_task,id=7202,text=720232,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  