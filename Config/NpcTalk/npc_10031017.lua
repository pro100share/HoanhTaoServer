--单个npc对话:npc_10031017.lua
local npc_id=10031017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003101711,},
  [2]={tp=tk.accept_check,id={2018,2019},},
  [3]={tp=tk.complete_check,id={2017,2018},},
  [4]={tp=tk.close,text=1,},
 },
--task 2017 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=201731,},
  [2]={tp=tk.complete_task,id=2017,text=201732,},
 },
--task 2018 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=201821,},
  [2]={tp=tk.page,id=4,text=201822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=201823,},
  [2]={tp=tk.page,id=5,text=201824,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=201825,},
  [2]={tp=tk.accept_task,id=2018,text=201826,},
 },
--task 2018 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=201831,},
  [2]={tp=tk.complete_task,id=2018,text=201832,},
 },
--task 2019 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=201921,},
  [2]={tp=tk.page,id=8,text=201922,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=201923,},
  [2]={tp=tk.accept_task,id=2019,text=201924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]