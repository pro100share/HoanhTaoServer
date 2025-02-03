--单个npc对话:npc_10071004.lua
local npc_id=10071004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100411,},
  [2]={tp=tk.accept_check,id={6029},},
  [3]={tp=tk.complete_check,id={6028},},
  [4]={tp=tk.close,text=1,},
 },
--task 6028 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=602831,},
  [2]={tp=tk.complete_task,id=6028,text=602832,},
 },
--task 6029 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=602921,},
  [2]={tp=tk.page,id=4,text=602922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=602923,},
  [2]={tp=tk.accept_task,id=6029,text=602924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  