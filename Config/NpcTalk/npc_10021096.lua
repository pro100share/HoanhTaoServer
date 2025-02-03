local npc_id=10021096
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=1002109601,},
	[2]={tp=tk.fun,sort=1,fun="zkn",param={},text=1002109602,},
 },
--task 2116 complete_talk
 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]