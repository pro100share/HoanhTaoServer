--单个npc对话:npc_10021002.lua
local npc_id=10021002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200211,},
  [2]={tp=tk.accept_check,id={2010,2101,2123,2139},},
  [3]={tp=tk.complete_check,id={2009,2101},},
  [4]={tp=tk.close,text=1,},
 },
--task 2009 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=200931,},
  [2]={tp=tk.complete_task,id=2009,text=200932,},
 },
--task 2010 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=201021,},
  [2]={tp=tk.page,id=4,text=201022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=201023,},
  [2]={tp=tk.accept_task,id=2010,text=201024,},
 },
--task 2101 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=210121,},
  [2]={tp=tk.page,id=16,text=210122,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=210123,},
  [2]={tp=tk.page,id=17,text=210124,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=210125,},
  [2]={tp=tk.accept_task,id=2101,text=210126}
 },
--task 2101 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=210131,},
  [2]={tp=tk.complete_task,id=2101,text=210132,},
 },
--task 2123 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=212321,},
  [2]={tp=tk.page,id=20,text=212322,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=212323,},
  [2]={tp=tk.page,id=21,text=212324,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=212325,},
  [2]={tp=tk.accept_task,id=2123,text=212326,},
 },
--task 2139 accept_talk
 [22]=
 {
  [1]={tp=tk.text,text=213921,},
  [2]={tp=tk.page,id=23,text=213922,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=213923,},
  [2]={tp=tk.page,id=24,text=213924,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=213925,},
  [2]={tp=tk.accept_task,id=2139,text=213926,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]