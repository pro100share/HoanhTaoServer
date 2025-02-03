--单个npc对话:npc_10091006.lua
local npc_id=10091006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100611,},
  [2]={tp=tk.accept_check,id={7001,7007},},
  [3]={tp=tk.complete_check,id={6059,7006},},
  [4]={tp=tk.close,text=1,},
 },
--task 6059 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=605931,},
  [2]={tp=tk.complete_task,id=6059,text=605932,},
 },
--task 7001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=700121,},
  [2]={tp=tk.page,id=4,text=700122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=700123,},
  [2]={tp=tk.accept_task,id=7001,text=700124,},
 },
--task 7006 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=700631,},
  [2]={tp=tk.complete_task,id=7006,text=700632,},
 },
--task 7007 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=700721,},
  [2]={tp=tk.page,id=7,text=700722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=700723,},
  [2]={tp=tk.accept_task,id=7007,text=700724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]