--单个npc对话:npc_10011008.lua
local npc_id=10011008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100811,},
  [2]={tp=tk.accept_check,id={},},
  [3]={tp=tk.complete_check,id={},},
  --[5]={tp=tk.fun,fun="zcs",param={},text=100134,},
  [8]={tp=tk.close,text=1,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]