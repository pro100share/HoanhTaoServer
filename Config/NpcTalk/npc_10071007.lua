--单个npc对话:npc_10071007.lua
local npc_id=10071007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100711,},
  [2]={tp=tk.accept_check,id={6015,6016,6017},},
  [3]={tp=tk.complete_check,id={6014,6015,6016},},
  [4]={tp=tk.close,text=1,},
 },
--task 6014 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=601431,},
  [2]={tp=tk.complete_task,id=6014,text=601432,},
 },
--task 6015 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=601521,},
  [2]={tp=tk.page,id=4,text=601522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=601523,},
  [2]={tp=tk.accept_task,id=6015,text=601524,},
 },
--task 6015 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=601531,},
  [2]={tp=tk.complete_task,id=6015,text=601532,},
 },
--task 6016 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=601621,},
  [2]={tp=tk.page,id=7,text=601622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=601623,},
  [2]={tp=tk.accept_task,id=6016,text=601624,},
 },
--task 6016 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=601631,},
  [2]={tp=tk.complete_task,id=6016,text=601632,},
 },

--task 6017 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=601721,},
  [2]={tp=tk.page,id=10,text=601722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=601723,},
  [2]={tp=tk.accept_task,id=6017,text=601724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]   