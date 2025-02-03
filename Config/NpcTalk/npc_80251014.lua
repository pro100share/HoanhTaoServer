--单个npc对话:npc_80251014.lua
local npc_id=80251014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8025100311,},
  [2]={tp=tk.accept_check,id={802504},},
  [3]={tp=tk.complete_check,id={802504,802510},},
  [4]={tp=tk.close,text=1,},
 },
--task 802504 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=80250421,},
  [2]={tp=tk.accept_task,id=802504,text=80250422,},
 },
--task 802504 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80250431,},
  [2]={tp=tk.complete_task,id=802504,text=80250432,},
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