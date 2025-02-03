--单个npc对话:npc_10051089.lua
local npc_id=10051089
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005108911,},
  --[2]={tp=tk.enter_dupl,dupl_id=1081,map_id=5095,text=666,},
  [2]={tp=tk.page,id=2,text=403351,},
 },
 [2]=
 {
  [1]={tp=tk.text,text=403352,},
  [2]={tp=tk.fun,fun="fuben",text=403353,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]