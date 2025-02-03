--单个npc对话:npc_10071033.lua
local npc_id=10071033
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007103311,},
  [2]={tp=tk.accept_check,id={6032},},
  [3]={tp=tk.complete_check,id={6031},},
  [4]={tp=tk.close,text=1,},
 },
--task 6031 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=603131,},
  [2]={tp=tk.complete_task,id=6031,text=603132,},
 },
--task 6032 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=603221,},
  [2]={tp=tk.page,id=4,text=603222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=603223,},
  [2]={tp=tk.accept_task,id=6032,text=603224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  