--单个npc对话:npc_10121029.lua
local npc_id=10121029
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102911,},
  [2]={tp=tk.accept_check,id={11070,11074,11075},},
  [3]={tp=tk.complete_check,id={11069,11073,11074},},
  [4]={tp=tk.close,text=1,},
 },
--task 11069 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1106931,},
  [2]={tp=tk.complete_task,id=11069,text=1106932,},
 },
--task 11070 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1107021,},
  [2]={tp=tk.page,id=4,text=1107022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1107023,},
  [2]={tp=tk.accept_task,id=11070,text=1107024,},
 },
--task 11073 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1107331,},
  [2]={tp=tk.complete_task,id=11073,text=1107332,},
 },
--task 11074 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1107421,},
  [2]={tp=tk.page,id=7,text=1107422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1107423,},
  [2]={tp=tk.accept_task,id=11074,text=1107424,},
 },
--task 11074 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1107431,},
  [2]={tp=tk.complete_task,id=11074,text=1107432,},
 },
--task 11075 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1107521,},
  [2]={tp=tk.page,id=10,text=1107522,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1107523,},
  [2]={tp=tk.accept_task,id=11075,text=1107524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]