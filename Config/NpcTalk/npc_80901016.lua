--单个npc对话:npc_80901016.lua
local npc_id=80901016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090101611,},
  [2]={tp=tk.accept_check,id={809006},},
  [3]={tp=tk.close,text=1,},
  },
--task 809006 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900621,},
  [2]={tp=tk.page,id=3,text=80900622,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=80900623,},
  [2]={tp=tk.page,id=4,text=80900624,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=80900625,},
  [2]={tp=tk.accept_task,id=809006,text=80900626,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
