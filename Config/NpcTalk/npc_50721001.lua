--单个npc对话:npc_10011001.lua
local npc_id=50721001
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=550,},
	[2]={tp=tk.fun,sort=1,fun="zkn",param={},text=551,},
	[3]={tp=tk.complete_check,id={2139},},	
	--[4]={tp=tk.shop,id=10000,text=7,},
 },
--task 2139 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=213931,},
  [2]={tp=tk.complete_task,id=2139,text=213932,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]