--单个npc对话:npc_10021090.lua
local npc_id=10021090
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002109011,},
  --[2]={tp=tk.accept_check,id={20103},},  
		[2]={tp=tk.task_fun,id=53,text=1002109012,},
  [3]={tp=tk.close,text=1,},
 },
-- --task 20101 accept_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=2010321,},
  -- [2]={tp=tk.accept_task,id=20103,text=2010322,},
 -- },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]