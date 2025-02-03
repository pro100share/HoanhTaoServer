--单个npc对话:npc_10081077.lua
local npc_id=10081077
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=801625,},
  [2]={tp=tk.fun,fun="shuaguai",text=801626,},
  [4]={tp=tk.close,text=1,},
 },
-- --task 6024 uncomplete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=801625,},
  -- [2]={tp=tk.fun,fun="shuaguai",text=801626,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  