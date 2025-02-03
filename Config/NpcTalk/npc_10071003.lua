--单个npc对话:npc_10071003.lua
local npc_id=10071003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100311,},
  [2]={tp=tk.accept_check,id={6051},},
  [3]={tp=tk.complete_check,id={6050},},
  [4]={tp=tk.close,text=1,},
 },
--task 6050 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=605031,},
  [2]={tp=tk.complete_task,id=6050,text=605032,},
 },
--task 6051 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=605121,},
  [2]={tp=tk.page,id=4,text=605122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=605123,},
  [2]={tp=tk.page,id=5,text=605124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=605125,},
  [2]={tp=tk.accept_task,id=6051,text=605126,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 