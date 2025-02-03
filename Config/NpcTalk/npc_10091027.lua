--单个npc对话:npc_10091027.lua
local npc_id=10091027
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102711,},
  [2]={tp=tk.accept_check,id={7205,7206},},
  [3]={tp=tk.complete_check,id={7205,7206},},
  [4]={tp=tk.close,text=1,},
 },
--task 7205 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=720521,},
  [2]={tp=tk.accept_task,id=7205,text=720522,},
 },
--task 7205 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=720531,},
  [2]={tp=tk.complete_task,id=7205,text=720532,},
 },
--task 7206 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=720621,},
  [2]={tp=tk.accept_task,id=7206,text=720622,},
 },
--task 7206 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=720631,},
  [2]={tp=tk.complete_task,id=7206,text=720632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  