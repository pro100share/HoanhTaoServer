--单个npc对话:npc_10061009.lua
local npc_id=10061009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100911,},
  [2]={tp=tk.accept_check,id={},},
  [3]={tp=tk.complete_check,id={},},
  [8]={tp=tk.close,text=1,},
 },
-- --task 5024 剧情
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=502445,},
  -- [2]={tp=tk.page,id=3,text=502446,},
 -- },
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=502447,},
  -- [2]={tp=tk.fun,fun="mon_born",text=502448,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 