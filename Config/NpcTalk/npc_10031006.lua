--单个npc对话:npc_10031006.lua
local npc_id=10031006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100611,},
  [2]={tp=tk.accept_check,id={2014,2015,2017},},
  [3]={tp=tk.complete_check,id={2013,2014,2016},},
  [4]={tp=tk.close,text=1,},
 },
--task 2013 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=201331,},
  [2]={tp=tk.complete_task,id=2013,text=201332,},
 },
--task 2014 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=201421,},
  [2]={tp=tk.page,id=4,text=201422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=201423,},
  [2]={tp=tk.accept_task,id=2014,text=201424,},
 },
--task 2014 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=201431,},
  [2]={tp=tk.complete_task,id=2014,text=201432,},
 },
--task 2015 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=201521,},
  [2]={tp=tk.accept_task,id=2015,text=201522,},
 },
--task 2016 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=201631,},
  [2]={tp=tk.complete_task,id=2016,text=201632,},
 },
--task 2017 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=201721,},
  [2]={tp=tk.page,id=10,text=201722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=201723,},
  [2]={tp=tk.page,id=11,text=201724,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=201725,},
  [2]={tp=tk.accept_task,id=2017,text=201726,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]