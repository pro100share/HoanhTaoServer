﻿--单个npc对话:npc_10101019.lua
local npc_id=10101019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101911,},
  [2]={tp=tk.accept_check,id={9201,9202},},
  [3]={tp=tk.complete_check,id={9201,9202},},
  [8]={tp=tk.close,text=1,},
 },
--task 9201 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=920121,},
  [2]={tp=tk.accept_task,id=9201,text=920122,},
 },
--task 9201 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=920131,},
  [2]={tp=tk.complete_task,id=9201,text=920132,},
 },
--task 9202 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=920221,},
  [2]={tp=tk.accept_task,id=9202,text=920222,},
 },
--task 9202 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=920231,},
  [2]={tp=tk.complete_task,id=9202,text=920232,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]