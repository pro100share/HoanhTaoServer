--单个npc对话:npc_10021001.lua
local npc_id=10021001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200111,},
  [2]={tp=tk.accept_check,id={2002,2009,2036,2114,2115,2138},},
  [3]={tp=tk.complete_check,id={2001,2008,2035,2114,2115},},
  [8]={tp=tk.close,text=1,},
 },
--task 2001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=200131,},
  [2]={tp=tk.complete_task,id=2001,text=200132,},
 },
--task 2002 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200221,},
  [2]={tp=tk.page,id=4,text=200222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=200223,},
  [2]={tp=tk.page,id=5,text=200224,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=200225,},
  [2]={tp=tk.accept_task,id=2002,text=200226,},
 },
--task 2008 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=200831,},
  [2]={tp=tk.complete_task,id=2008,text=200832,},
 },
--task 2009 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=200921,},
  [2]={tp=tk.page,id=8,text=200922,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=200923,},
  [2]={tp=tk.page,id=9,text=200924,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=200925,},
  [2]={tp=tk.accept_task,id=2009,text=200926,},
 },
--task 2035 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=203531,},
  [2]={tp=tk.complete_task,id=2035,text=203532,},
 },
--task 2036 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=203621,},
  [2]={tp=tk.page,id=12,text=203622,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=203623,},
  [2]={tp=tk.page,id=14,text=203624,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=203625,},
  [2]={tp=tk.accept_task,id=2036,text=203626,},
 },
-- --task 6023 complete_talk
 -- [35]=
 -- {
  -- [1]={tp=tk.text,text=602331,},
  -- [2]={tp=tk.complete_task,id=6023,text=602332,},
 -- },
-- --task 6024 accept_talk
 -- [36]=
 -- {
  -- [1]={tp=tk.text,text=602421,},
  -- [2]={tp=tk.page,id=37,text=602422,},
 -- },
 -- [37]=
 -- {
  -- [1]={tp=tk.text,text=602423,},
  -- [2]={tp=tk.accept_task,id=6024,text=602424,},
 -- }, 
--task 2103 accept_talk
 [38]=
 {
  [1]={tp=tk.text,text=210321,},
  [2]={tp=tk.accept_task,id=2103,text=210322,},
 },
--task 2114 accept_talk
 [39]=
 {
  [1]={tp=tk.text,text=211421,},
  [2]={tp=tk.page,id=40,text=211422,},
 },
 [40]=
 {
  [1]={tp=tk.text,text=211423,},
  [2]={tp=tk.accept_task,id=2114,text=211424,},
 },
--task 2114 complete_talk
 [41]=
 {
  [1]={tp=tk.text,text=211431,},
  [2]={tp=tk.complete_task,id=2114,text=211432,},
 },
--task 2115 accept_talk
 [42]=
 {
  [1]={tp=tk.text,text=211521,},
  [2]={tp=tk.page,id=43,text=211522,},
 },
 [43]=
 {
  [1]={tp=tk.text,text=211523,},
  [2]={tp=tk.accept_task,id=2115,text=211524,},
 },
--task 2115 complete_talk
 [44]=
 {
  [1]={tp=tk.text,text=211531,},
  [2]={tp=tk.complete_task,id=2115,text=211532,},
 },
--task 2138 accept_talk
 [45]=
 {
  [1]={tp=tk.text,text=213821,},
  [2]={tp=tk.page,id=46,text=213822,},
 },
 [46]=
 {
  [1]={tp=tk.text,text=213823,},
  [2]={tp=tk.page,id=47,text=213824,},
 },
 [47]=
 {
  [1]={tp=tk.text,text=213825,},
  [2]={tp=tk.accept_task,id=2138,text=213826,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]