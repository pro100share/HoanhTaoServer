--单个npc对话:npc_10071014.lua
local npc_id=10071014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101411,},
  [2]={tp=tk.accept_check,id={6039},},
  [3]={tp=tk.complete_check,id={6038},},
  [4]={tp=tk.close,text=1,},
 },
--task 6038 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=603831,},
  [2]={tp=tk.complete_task,id=6038,text=603832,},
 },
--task 6039 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=603921,},
  [2]={tp=tk.page,id=4,text=603922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=603923,},
  [2]={tp=tk.accept_task,id=6039,text=603924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  