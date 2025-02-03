--单个npc对话:npc_10061007.lua
local npc_id=10061007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100711,},
  [2]={tp=tk.accept_check,id={5038,5039},},
  [3]={tp=tk.complete_check,id={5037,5038},},
  [8]={tp=tk.close,text=1,},
 },
--task 5037 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=503731,},
  [2]={tp=tk.complete_task,id=5037,text=503732,},
 },
--task 5038 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=503821,},
  [2]={tp=tk.page,id=4,text=503822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=503823,},
  [2]={tp=tk.accept_task,id=5038,text=503824,},
 },
 -- [5]=
 -- {
  -- [1]={tp=tk.text,text=503825,},
  -- [2]={tp=tk.accept_task,id=5038,text=503826,},
 -- },
--task 5038 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=503831,},
  [2]={tp=tk.complete_task,id=5038,text=503832,},
 },
--task 5039 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=503921,},
  [2]={tp=tk.accept_task,id=5039,text=503922,},
 },
 -- [8]=
 -- {
  -- [1]={tp=tk.text,text=503923,},
  -- [2]={tp=tk.accept_task,id=5039,text=503924,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 