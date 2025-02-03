--单个npc对话:npc_10101003.lua
local npc_id=10101003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100311,},
  [2]={tp=tk.accept_check,id={9027,9028},},
  [3]={tp=tk.complete_check,id={9026,9027},},
  [8]={tp=tk.close,text=1,},
 },
--task 9026 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=902631,},
  [2]={tp=tk.complete_task,id=9026,text=902632,},
 },
--task 9027 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=902721,},
  [2]={tp=tk.page,id=4,text=902722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=902723,},
  [2]={tp=tk.accept_task,id=9027,text=902724,},
 },
--task 9027 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=902731,},
  [2]={tp=tk.complete_task,id=9027,text=902732,},
 },
--task 9028 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=902821,},
  [2]={tp=tk.page,id=7,text=902822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=902823,},
  [2]={tp=tk.accept_task,id=9028,text=902824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]