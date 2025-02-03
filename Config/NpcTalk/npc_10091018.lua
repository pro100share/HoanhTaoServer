--单个npc对话:npc_10091018.lua
local npc_id=10091018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=702641,},
  [2]={tp=tk.fun,fun="shuaguai",text=702642,},
 },
-- --task 7026 uncomplete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=702641,},
  -- [2]={tp=tk.fun,fun="shuaguai",text=702642,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]