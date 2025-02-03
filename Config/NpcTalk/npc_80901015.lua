﻿--单个npc对话:npc_80901015.lua
local npc_id=80901015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090101511,},
  [2]={tp=tk.accept_check,id={809005},},
  [3]={tp=tk.close,text=1,},
  },
--task 809005 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900521,},
  [2]={tp=tk.page,id=3,text=80900522,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=80900523,},
  [2]={tp=tk.accept_task,id=809005,text=80900524,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
