﻿--单个npc对话:npc_10041009.lua
local npc_id=10041009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100911,}, 
  [2]={tp=tk.enter_dupl,dupl_id=1080,map_id=5003,text=666,},
  [3]={tp=tk.close,text=1,},
 }, 
--task 2113 uncomplete_talk
 [2]=
 {
  [1]={tp=tk.text,text=211341,},
  [2]={tp=tk.enter_dupl,dupl_id=1084,map_id=5084,text=666,}, 
 }, 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 