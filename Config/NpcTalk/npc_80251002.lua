--单个npc对话:npc_80251002.lua
local npc_id=80251002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100211,},
  --[2]={tp=tk.page,id=2,text=8025100212,},
  [4]={tp=tk.close,text=1,},
 },
 [2]=
 {
  [1]={tp=tk.text,text=8025100215,},
  [2]={tp=tk.close,text=8025100216,},
  [5]={tp=tk.fun,fun="Charge",param={},text=8025100217,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]