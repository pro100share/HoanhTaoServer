﻿--单个npc对话:npc_10121092.lua
local npc_id=10121092
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1103051,},
  [2]={tp=tk.fun,fun="shuaguai",text=1103052,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]