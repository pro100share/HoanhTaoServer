--单个npc对话:npc_10101001.lua
local npc_id=10101001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100111,},
  [2]={tp=tk.accept_check,id={9030,9031,9033},},
  [3]={tp=tk.complete_check,id={9029,9030,9032},},
  [8]={tp=tk.close,text=1,},
 },
--task 9029 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=902931,},
  [2]={tp=tk.complete_task,id=9029,text=902932,},
 },
--task 9030 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=903021,},
  [2]={tp=tk.page,id=4,text=903022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=903023,},
  [2]={tp=tk.accept_task,id=9030,text=903024,},
 },
--task 9030 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=903031,},
  [2]={tp=tk.complete_task,id=9030,text=903032,},
 },
--task 9031 accept_talk 
 [6]=
 {
  [1]={tp=tk.text,text=903121,},
  [2]={tp=tk.page,id=7,text=903122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=903123,},
  [2]={tp=tk.accept_task,id=9031,text=903124,},
 },
--task 9032 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=903231,},
  [2]={tp=tk.complete_task,id=9032,text=903232,},
 },
--task 9033 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=903321,},
  [2]={tp=tk.accept_task,id=9033,text=903322,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]