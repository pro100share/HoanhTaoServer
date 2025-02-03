--单个npc对话:npc_10121027.lua
local npc_id=10121027
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102711,},
  [2]={tp=tk.accept_check,id={11066},},
  [3]={tp=tk.complete_check,id={11065},},
  [4]={tp=tk.close,text=1,},
 },
--task 11065 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1106531,},
  [2]={tp=tk.complete_task,id=11065,text=1106532,},
 },
--task 11066 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1106621,},
  [2]={tp=tk.page,id=4,text=1106622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1106623,},
  [2]={tp=tk.accept_task,id=11066,text=1106624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]