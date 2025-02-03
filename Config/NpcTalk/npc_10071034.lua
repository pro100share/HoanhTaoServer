--单个npc对话:npc_10071034.lua
local npc_id=10071034
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=601946,},
  [2]={tp=tk.fun,fun="shuaguai",text=601947,},
  --[4]={tp=tk.close,text=1,},
 },
-- --task 6019 complete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=601946,},
  -- [2]={tp=tk.fun,fun="shuaguai",text=601947,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  