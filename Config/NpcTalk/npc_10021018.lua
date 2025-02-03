--单个npc对话:npc_10021018.lua
local npc_id=10021018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101811,},
  [2]={tp=tk.war_over,id=10050,text=96},
  [3]={tp=tk.war_over,id=10051,text=92},
  -- [2]={tp=tk.page,id=2,text=91,},
  -- [3]={tp=tk.page,id=3,text=92,},
  [8]={tp=tk.close,text=1,},
 },
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=1002101812,},
  -- [2]={tp=tk.page,id=4,text=1002101813,},
 -- },
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=1002101812,},
  -- [2]={tp=tk.page,id=4,text=1002101813,},
 -- },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=1002101814,},
  -- [2]={tp=tk.close,text=1002101815,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]