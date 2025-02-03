--单个npc对话:npc_10021005.lua
local npc_id=10021005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200511,},
  [2]={tp=tk.accept_check,id={2043,2044},},
  [3]={tp=tk.complete_check,id={2037,2043},},
  [5]={tp=tk.strong,text=9,},
  --[6]={tp=tk.append_prop,text=10,},
  [8]={tp=tk.close,text=1,},
 },
-- --task 2005 complete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=200531,},
  -- [2]={tp=tk.complete_task,id=2005,text=200532,},
 -- },
-- --task 2006 accept_talk
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=200621,},
  -- [2]={tp=tk.page,id=4,text=200622,},
 -- },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=200623,},
  -- [2]={tp=tk.accept_task,id=2006,text=200624,},
 -- },
-- --task 2006 complete_talk
 -- [5]=
 -- {
  -- [1]={tp=tk.text,text=200631,},
  -- [2]={tp=tk.complete_task,id=2006,text=200632,},
 -- },
-- --task 2007 accept_talk
 -- [6]=
 -- {
  -- [1]={tp=tk.text,text=200721,},
  -- [2]={tp=tk.page,id=7,text=200722,},
 -- },
 -- [7]=
 -- {
  -- [1]={tp=tk.text,text=200723,},
  -- [2]={tp=tk.accept_task,id=2007,text=200724,},
 -- },
--task 2037 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=203731,},
  [2]={tp=tk.complete_task,id=2037,text=203732,},
 },
--task 2043 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=204321,},
  [2]={tp=tk.accept_task,id=2043,text=204322,},
 },
--task 2043 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=204331,},
  [2]={tp=tk.complete_task,id=2043,text=204332,},
 },
--task 2044 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=204421,},
  [2]={tp=tk.page,id=13,text=204422,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=204423,},
  [2]={tp=tk.accept_task,id=2044,text=204424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]