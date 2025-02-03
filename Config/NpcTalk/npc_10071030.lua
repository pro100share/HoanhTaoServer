--单个npc对话:npc_10071030.lua
local npc_id=10071030
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100611,},
  [2]={tp=tk.accept_check,id={6019,6021},},
  [3]={tp=tk.complete_check,id={6018,6020},},
  [4]={tp=tk.close,text=1,},
 },
--task 6018 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=601831,},
  [2]={tp=tk.complete_task,id=6018,text=601832,}
 },
--task 6019 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=601921,},
  [2]={tp=tk.page,id=13,text=601922,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=601923,},
  [2]={tp=tk.accept_task,id=6019,text=601924,},
 },
--task 6020 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=602031,},
  [2]={tp=tk.complete_task,id=6020,text=602032,},
 },
--task 6021 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=602121,},
  [2]={tp=tk.page,id=16,text=602122,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=602123,},
  [2]={tp=tk.accept_task,id=6021,text=602124,},
 }, 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]   