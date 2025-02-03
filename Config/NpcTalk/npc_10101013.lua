--单个npc对话:npc_10101013.lua
local npc_id=10101013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101311,},
  [2]={tp=tk.accept_check,id={9043,9044,9055},},
  [3]={tp=tk.complete_check,id={9042,9043,9054},},
  [8]={tp=tk.close,text=1,},
 },
--task 9042 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=904231,},
  [2]={tp=tk.complete_task,id=9042,text=904232,},
 },
--task 9043 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=904321,},
  [2]={tp=tk.page,id=4,text=904322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=904323,},
  [2]={tp=tk.accept_task,id=9043,text=904324,},
 },
--task 9043 complete_talk 
 [5]=
 {
  [1]={tp=tk.text,text=904331,},
  [2]={tp=tk.complete_task,id=9043,text=904332,},
 },
--task 9044 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=904421,},
  [2]={tp=tk.page,id=7,text=904422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=904423,},
  [2]={tp=tk.accept_task,id=9044,text=904424,},
 },
--task 9054 complete_talk 
 [8]=
 {
  [1]={tp=tk.text,text=905431,},
  [2]={tp=tk.complete_task,id=9054,text=905432,},
 },
--task 9055 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=905521,},
  [2]={tp=tk.page,id=10,text=905522,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=905523,},
  [2]={tp=tk.accept_task,id=9055,text=905524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]