--单个npc对话:npc_10111076.lua
local npc_id=10111076
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007751,},
  [2]={tp=tk.fun,fun="shuaguai",text=1007752,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]