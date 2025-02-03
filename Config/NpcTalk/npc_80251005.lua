--单个npc对话:npc_80251005.lua
local npc_id=80251005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100511,},
  [2]={tp=tk.accept_check,id={802510},},
  [3]={tp=tk.complete_check,id={},},
  [4]={tp=tk.close,text=1,},
 },
--task 802510 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80251021,},
  [2]={tp=tk.accept_task,id=802510,text=80251022,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]