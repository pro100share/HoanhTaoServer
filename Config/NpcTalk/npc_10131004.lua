--单个npc对话:npc_10131004.lua
local npc_id=10131004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100411,},
  [2]={tp=tk.accept_check,id={12019,12021},},
  [3]={tp=tk.complete_check,id={12018,12020},},
  [4]={tp=tk.close,text=1,},
 },
--task 12018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1201831,},
  [2]={tp=tk.complete_task,id=12018,text=1201832,},
 },
--task 12019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1201921,},
  [2]={tp=tk.page,id=4,text=1201922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1201923,},
  [2]={tp=tk.page,id=5,text=1201924,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1201925,},
  [2]={tp=tk.accept_task,id=12019,text=1201926,},
 },
--task 12020 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1202031,},
  [2]={tp=tk.complete_task,id=12020,text=1202032,},
 },
--task 12021 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1202121,},
  [2]={tp=tk.page,id=8,text=1202122,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1202123,},
  [2]={tp=tk.accept_task,id=12021,text=1202124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]