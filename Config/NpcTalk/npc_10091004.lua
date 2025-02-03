--单个npc对话:npc_10091004.lua
local npc_id=10091004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100411,},
  [2]={tp=tk.accept_check,id={7013,7017,7023},},
  [3]={tp=tk.complete_check,id={7012,7016,7022},},
  [4]={tp=tk.close,text=1,},
 },
--task 7012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=701231,},
  [2]={tp=tk.complete_task,id=7012,text=701232,},
 },
--task 7013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=701321,},
  [2]={tp=tk.page,id=4,text=701322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=701323,},
  [2]={tp=tk.accept_task,id=7013,text=701324,},
 },
--task 7016 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=701631,},
  [2]={tp=tk.complete_task,id=7016,text=701632,},
 },
--task 7017 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=701721,},
  [2]={tp=tk.page,id=7,text=701722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=701723,},
  [2]={tp=tk.accept_task,id=7017,text=701724,},
 },
--task 7022 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=702231,},
  [2]={tp=tk.complete_task,id=7022,text=702232,},
 },
--task 7023 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=702321,},
  [2]={tp=tk.page,id=10,text=702322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=702323,},
  [2]={tp=tk.accept_task,id=7023,text=702324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]