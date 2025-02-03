--单个npc对话:npc_10031004.lua
local npc_id=10031004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100411,},
  [2]={tp=tk.accept_check,id={2102,2103},},
  [3]={tp=tk.complete_check,id={2102,2103},},
  [4]={tp=tk.shop,id=10000,text=7,},
  [5]={tp=tk.close,text=1,},
 },
--task 2102 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=210221,},
  [2]={tp=tk.page,id=3,text=210222,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=210223,},
  [2]={tp=tk.page,id=7,text=210224,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=210225,},
  [2]={tp=tk.page,id=8,text=210226,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=210227,},
  [2]={tp=tk.accept_task,id=2102,text=210228,},
 },
--task 2102 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=210231,},
  [2]={tp=tk.complete_task,id=2102,text=210232,},
 },
--task 2103 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=210321,},
  [2]={tp=tk.accept_task,id=2103,text=210322,},
 },
--task 2103 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=210331,},
  [2]={tp=tk.complete_task,id=2103,text=210332,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]