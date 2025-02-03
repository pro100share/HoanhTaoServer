--单个npc对话:npc_80901018.lua
local npc_id=80901018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090101811,},
  [2]={tp=tk.complete_check,id={809005},},
  [3]={tp=tk.close,text=1,},
  },
--task 809005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900531,},
  [2]={tp=tk.complete_task,id=809005,text=80900532,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
