﻿--单个npc对话:npc_10121005.lua
local npc_id=10121005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100511,},
  [2]={tp=tk.accept_check,id={11011},},
  [3]={tp=tk.complete_check,id={11010},},
  [4]={tp=tk.close,text=1,},
 },
--task 11010 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1101031,},
  [2]={tp=tk.complete_task,id=11010,text=1101032,},
 },
--task 11011 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1101121,},
  [2]={tp=tk.page,id=4,text=1101122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1101123,},
  [2]={tp=tk.accept_task,id=11011,text=1101124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]