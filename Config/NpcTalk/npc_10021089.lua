﻿--单个npc对话:npc_10021089.lua
local npc_id=10021089
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002108911,},
		[2]={tp=tk.play_sound,id=1013,text=1002108912,},
  [3]={tp=tk.web_link,url="http://youxi.baidu.com/wj/alan/?pid=11046300508_1017733",text=1002108913},
  [4]={tp=tk.close,text=1,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]