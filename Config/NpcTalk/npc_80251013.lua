--单个npc对话:npc_80251013.lua
local npc_id=80251013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100311,},
  [2]={tp=tk.accept_check,id={802503},},
  [3]={tp=tk.complete_check,id={802503,802510},},
  [4]={tp=tk.close,text=1,},
 },
--task 802503 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250321,},
  [2]={tp=tk.accept_task,id=802503,text=80250322,},
 },
--task 802503 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250331,},
  [2]={tp=tk.complete_task,id=802503,text=80250332,},
 },
--task 802510 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=80251031,},
  [2]={tp=tk.complete_task,id=802510,text=80251032,},
 }, 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]