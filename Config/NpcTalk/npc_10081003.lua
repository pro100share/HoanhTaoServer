--单个npc对话:npc_10081003.lua
local npc_id=10081003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100311,},
  [2]={tp=tk.accept_check,id={8013,8014,8015,8018},},
  [3]={tp=tk.complete_check,id={8012,8013,8014,8017},},
  [4]={tp=tk.close,text=1,},
 },
--task 8012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=801231,},
  [2]={tp=tk.complete_task,id=8012,text=801232,},
 },
--task 8013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=801321,},
  [2]={tp=tk.page,id=4,text=801322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=801323,},
  [2]={tp=tk.accept_task,id=8013,text=801324,},
 },
--task 8013 complete_talk 
 [5]=
 {
  [1]={tp=tk.text,text=801331,},
  [2]={tp=tk.complete_task,id=8013,text=801332,},
 },
--task 8014 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=801421,},
  [2]={tp=tk.page,id=7,text=801422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=801423,},
  [2]={tp=tk.accept_task,id=8014,text=801424,},
 },
--task 8014 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=801431,},
  [2]={tp=tk.complete_task,id=8014,text=801432,},
 },
--task 8015 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=801521,},
  [2]={tp=tk.page,id=10,text=801522,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=801523,},
  [2]={tp=tk.page,id=14,text=801524,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=801525,},
  [2]={tp=tk.accept_task,id=8015,text=801526,},
 },
--task 8017 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=801731,},
  [2]={tp=tk.complete_task,id=8017,text=801732,},
 },
--task 8018 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=801821,},
  [2]={tp=tk.page,id=13,text=801822,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=801823,},
  [2]={tp=tk.accept_task,id=8018,text=801824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]