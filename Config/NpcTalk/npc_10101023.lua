--单个npc对话:npc_10101023.lua
local npc_id=10101023
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010102311,},
  [2]={tp=tk.accept_check,id={9206,9207},},
  [3]={tp=tk.complete_check,id={9206,9207},},
  [8]={tp=tk.close,text=1,},
 },
--task 9206 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=920621,},
  [2]={tp=tk.accept_task,id=9206,text=920622,},
 },
--task 9206 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=920631,},
  [2]={tp=tk.complete_task,id=9206,text=920632,},
 },
--task 9207 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=920721,},
  [2]={tp=tk.accept_task,id=9207,text=920722,},
 },
--task 9207 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=920731,},
  [2]={tp=tk.complete_task,id=9207,text=920732,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]