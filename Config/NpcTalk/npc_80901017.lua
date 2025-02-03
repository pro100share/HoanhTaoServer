--单个npc对话:npc_80901017.lua
local npc_id=80901017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090101711,},
  [2]={tp=tk.complete_check,id={809004},},
  [3]={tp=tk.close,text=1,},
  },
--task 809004 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900431,},
  [2]={tp=tk.page,id=3,text=80900432,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=80900433,},
  [2]={tp=tk.complete_task,id=809004,text=80900434,},
 },
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
