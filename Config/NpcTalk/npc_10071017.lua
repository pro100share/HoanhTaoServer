--单个npc对话:npc_10071017.lua
local npc_id=10071017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101711,},
  [2]={tp=tk.accept_check,id={6024},},
  [3]={tp=tk.complete_check,id={6023},},
  [4]={tp=tk.close,text=1,},
 },
-- --task 6021 complete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=602131,},
  -- [2]={tp=tk.complete_task,id=6021,text=602132,},
 -- },
-- --task 6022 accept_talk
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=602221,},
  -- [2]={tp=tk.page,id=4,text=602222,},
 -- },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=602223,},
  -- [2]={tp=tk.accept_task,id=6022,text=602224,},
 -- },
--task 6023 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=602331,},
  [2]={tp=tk.complete_task,id=6023,text=602332,},
 },
--task 6024 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=602421,},
  [2]={tp=tk.page,id=7,text=602422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=602423,},
  [2]={tp=tk.accept_task,id=6024,text=602424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  