--单个npc对话:npc_10011003.lua
local npc_id=10011003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100311,},
  [2]={tp=tk.accept_check,id={1005,1006},},
  [3]={tp=tk.complete_check,id={1004,1005},},
  [4]={tp=tk.shop,id=30000,text=2,},
  [8]={tp=tk.close,text=1,},
 },
--task 1004 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=100431,},
  [2]={tp=tk.complete_task,id=1004,text=100432,},
 },
--task 1005 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=100521,},
  [2]={tp=tk.page,id=4,text=100522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=100523,},
  [2]={tp=tk.accept_task,id=1005,text=100524,},
 },
--task 1005 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=100531,},
  [2]={tp=tk.complete_task,id=1005,text=100532,},
 },
--task 1006 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=100621,},
  [2]={tp=tk.accept_task,id=1006,text=100622,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]