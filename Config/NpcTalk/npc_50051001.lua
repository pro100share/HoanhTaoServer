--单个npc对话:npc_50051001.lua
local npc_id=50051001
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=5005100111,},
    [2]={tp=tk.fun,sort=1,fun="zkn",param={},text=151,},
	[5]={tp=tk.complete_check,id={2125},},	
 },
--task 2125 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=212531,},
  [2]={tp=tk.complete_task,id=2125,text=212532,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]