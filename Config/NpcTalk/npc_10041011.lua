--单个npc对话:npc_10041011.lua
local npc_id=10041011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101111,},
  [2]={tp=tk.accept_check,id={3019},},
  [3]={tp=tk.complete_check,id={3018},},
  [8]={tp=tk.close,text=1,},
 },
--task 3018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=301831,},
  [2]={tp=tk.complete_task,id=3018,text=301832,},
 },
--task 3019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=301921,},
  [2]={tp=tk.page,id=4,text=301922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=301923,},
  [2]={tp=tk.accept_task,id=3019,text=301924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  