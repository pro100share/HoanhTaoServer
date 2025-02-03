--单个npc对话:npc_10121007.lua
local npc_id=10121007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100711,},
  [2]={tp=tk.accept_check,id={11017,11018},},
  [3]={tp=tk.complete_check,id={11016,11017},},
  [4]={tp=tk.close,text=1,},
 },
--task 11016 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1101631,},
  [2]={tp=tk.complete_task,id=11016,text=1101632,},
 },
--task 11017 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1101721,},
  [2]={tp=tk.accept_task,id=11017,text=1101722,},
 },
--task 11017 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=1101731,},
  [2]={tp=tk.complete_task,id=11017,text=1101732,},
 },
--task 11018 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=1101821,},
  [2]={tp=tk.page,id=6,text=1101822,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=1101823,},
  [2]={tp=tk.accept_task,id=11018,text=1101824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]