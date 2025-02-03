--单个npc对话:npc_10101008.lua
local npc_id=10101008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100811,},
  [2]={tp=tk.accept_check,id={9019,9020,9023},},
  [3]={tp=tk.complete_check,id={9018,9019,9022},},
  [8]={tp=tk.close,text=1,},
 },
--task 9018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=901831,},
  [2]={tp=tk.complete_task,id=9018,text=901832,},
 },
--task 9019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=901921,},
  [2]={tp=tk.page,id=4,text=901922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=901923,},
  [2]={tp=tk.accept_task,id=9019,text=901924,},
 },
--task 9019 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=901931,},
  [2]={tp=tk.complete_task,id=9019,text=901932,},
 },
--task 9020 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=902021,},
  [2]={tp=tk.page,id=7,text=902022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=902023,},
  [2]={tp=tk.accept_task,id=9020,text=902024,},
 },
--task 9022 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=902231,},
  [2]={tp=tk.complete_task,id=9022,text=902232,},
 },
--task 9023 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=902321,},
  [2]={tp=tk.page,id=10,text=902322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=902323,},
  [2]={tp=tk.accept_task,id=9023,text=902324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]