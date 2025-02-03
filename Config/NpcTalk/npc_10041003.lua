--单个npc对话:npc_10041003.lua
local npc_id=10041003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100311,},
  [2]={tp=tk.accept_check,id={3017,3018},},
  [3]={tp=tk.complete_check,id={3016,3017},},
  [8]={tp=tk.close,text=1,},
 },
--task 3016 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=301631,},
  [2]={tp=tk.complete_task,id=3016,text=301632,},
 },
--task 3017 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=301721,},
  [2]={tp=tk.accept_task,id=3017,text=301722,},
 },
--task 3017 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=301731,},
  [2]={tp=tk.complete_task,id=3017,text=301732,},
 },
--task 3018 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=301821,},
  [2]={tp=tk.page,id=7,text=301822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=301823,},
  [2]={tp=tk.accept_task,id=3018,text=301824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]