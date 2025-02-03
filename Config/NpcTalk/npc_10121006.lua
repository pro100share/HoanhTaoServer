--单个npc对话:npc_10121006.lua
local npc_id=10121006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100611,},
  [2]={tp=tk.accept_check,id={11013,11014},},
  [3]={tp=tk.complete_check,id={11012,11013},},
  [4]={tp=tk.close,text=1,},
 },
--task 11012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1101231,},
  [2]={tp=tk.complete_task,id=11012,text=1101232,},
 },
--task 11013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1101321,},
  [2]={tp=tk.page,id=4,text=1101322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1101323,},
  [2]={tp=tk.accept_task,id=11013,text=1101324,},
 },
--task 11013 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1101331,},
  [2]={tp=tk.complete_task,id=11013,text=1101332,},
 },
--task 11014 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1101421,},
  [2]={tp=tk.page,id=7,text=1101422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1101423,},
  [2]={tp=tk.accept_task,id=11014,text=1101424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]