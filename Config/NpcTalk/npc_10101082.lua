--单个npc对话:npc_10101082.lua
local npc_id=10101082
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=904721,},
  [2]={tp=tk.page,id=2,text=904722,},
 },
 [2]=
 {
  [1]={tp=tk.text,text=904723,},
  [2]={tp=tk.fun,fun="shuaguai",text=904724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]