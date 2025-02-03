--单个npc对话:npc_10091007.lua
local npc_id=10091007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100711,}, 
  [2]={tp=tk.enter_dupl,dupl_id=1092,map_id=5092,text=1009100701,},
  -- [3]={tp=tk.enter_dupl,dupl_id=1093,map_id=5093,text=1009100702,},
  -- [4]={tp=tk.enter_dupl,dupl_id=1094,map_id=5094,text=1009100703,},  
  [5]={tp=tk.close,text=1,},
 }, 

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 