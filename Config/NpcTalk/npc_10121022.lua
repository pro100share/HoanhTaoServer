--单个npc对话:npc_10121022.lua
local npc_id=10121022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102211,},
  [2]={tp=tk.accept_check,id={11062,11063,11077},},
  [3]={tp=tk.complete_check,id={11061,11062,11076},},
  [4]={tp=tk.close,text=1,},
 },
--task 11061 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1106131,},
  [2]={tp=tk.complete_task,id=11061,text=1106132,},
 },
--task 11062 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1106221,},
  [2]={tp=tk.page,id=4,text=1106222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1106223,},
  [2]={tp=tk.page,id=12,text=1106224,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1106225,},
  [2]={tp=tk.accept_task,id=11062,text=1106226,}, 
 },
--task 11062 complete_talk 
 [5]=
 {
  [1]={tp=tk.text,text=1106231,},
  [2]={tp=tk.complete_task,id=11062,text=1106232,},
 },
--task 11063 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1106321,},
  [2]={tp=tk.page,id=7,text=1106322,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1106323,},
  [2]={tp=tk.accept_task,id=11063,text=1106324,},
 },
--task 11076 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1107631,},
  [2]={tp=tk.complete_task,id=11076,text=1107632,},
 },
--task 11077 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1107721,},
  [2]={tp=tk.page,id=10,text=1107722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1107723,},
  [2]={tp=tk.page,id=11,text=1107724,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=1107725,},
  [2]={tp=tk.accept_task,id=11077,text=1107726,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]