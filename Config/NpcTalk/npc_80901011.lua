--单个npc对话:npc_80901011.lua
local npc_id=80901011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090101111,},
  [2]={tp=tk.accept_check,id={809014},},
  [3]={tp=tk.close,text=1,},
  },
--task 809014 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80901421,},
  [2]={tp=tk.accept_task,id=809014,text=80901422,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
