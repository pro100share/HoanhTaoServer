--单个npc对话:npc_10071028.lua
local npc_id=10071028
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007102811,}, 
  [2]={tp=tk.enter_dupl,dupl_id=1090,map_id=5090,text=603101,},
  [3]={tp=tk.close,text=1,},
 }, 

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 