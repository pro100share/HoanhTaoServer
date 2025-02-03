--单个npc对话:npc_10031023.lua
local npc_id=10031023
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003102311,},
  [2]={tp=tk.accept_check,id={2042,2013},},
  [3]={tp=tk.complete_check,id={2011,2012},},
  [4]={tp=tk.close,text=1,},
 },
--task 2011 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=201131,},
  [2]={tp=tk.complete_task,id=2011,text=201132,},
 },
--task 2012 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=201221,},
  [2]={tp=tk.page,id=4,text=201222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=201223,},
  [2]={tp=tk.page,id=8,text=201224,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=201225,},
  [2]={tp=tk.accept_task,id=2042,text=201226,},
 },
--task 2012 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=201231,},
  [2]={tp=tk.complete_task,id=2012,text=201232,},
 },
--task 2013 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=201321,},
  [2]={tp=tk.page,id=7,text=201322,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=201323,},
  [2]={tp=tk.accept_task,id=2013,text=201324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]