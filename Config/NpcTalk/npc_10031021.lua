--单个npc对话:npc_10031021.lua
local npc_id=10031021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003102111,},
  [2]={tp=tk.accept_check,id={2023,2029},},
  [3]={tp=tk.complete_check,id={2022,2028,2029},},
  [4]={tp=tk.close,text=1,},
 },
--task 2022 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=202231,},
  [2]={tp=tk.complete_task,id=2022,text=202232,},
 },
--task 2023 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=202321,},
  [2]={tp=tk.page,id=4,text=202322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=202323,},
  [2]={tp=tk.page,id=5,text=202324,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=202325,},
  [2]={tp=tk.accept_task,id=2023,text=202326,},
 },
--task 2028 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=202831,},
  [2]={tp=tk.complete_task,id=2028,text=202832,},
 },
--task 2029 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=202921,},
  [2]={tp=tk.page,id=8,text=202922,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=202923,},
  [2]={tp=tk.page,id=9,text=202924,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=202925,},
  [2]={tp=tk.accept_task,id=2029,text=202926,},
 },
--task 2029 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=202931,},
  [2]={tp=tk.complete_task,id=2029,text=202932,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]