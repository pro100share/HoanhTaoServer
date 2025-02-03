--单个npc对话:npc_10071002.lua
local npc_id=10071002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100211,},
  [2]={tp=tk.accept_check,id={6048},},
  [3]={tp=tk.complete_check,id={6047},},
  [4]={tp=tk.close,text=1,},
 },
--task 6047 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=604731,},
  [2]={tp=tk.complete_task,id=6047,text=604732,},
 },
--task 6048 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=604821,},
  [2]={tp=tk.accept_task,id=6048,text=604822,},
 },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=604823,},
  -- [2]={tp=tk.accept_task,id=6048,text=604824,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]