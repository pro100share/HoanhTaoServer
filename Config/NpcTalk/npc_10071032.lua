--单个npc对话:npc_10071032.lua
local npc_id=10071032
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007103211,},
  [2]={tp=tk.accept_check,id={6034},},
  [3]={tp=tk.complete_check,id={6033},},
  [4]={tp=tk.close,text=1,},
 },
--task 6033 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=603331,},
  [2]={tp=tk.complete_task,id=6033,text=603332,},
 },
--task 6034 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=603421,},
  [2]={tp=tk.page,id=4,text=603422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=603423,},
  [2]={tp=tk.accept_task,id=6034,text=603424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  