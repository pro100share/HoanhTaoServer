--单个npc对话:npc_10091016.lua
local npc_id=10091016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009101611,},
  [2]={tp=tk.accept_check,id={7026,7028},},
  [3]={tp=tk.complete_check,id={7025,7027},},
  [4]={tp=tk.close,text=1,},
 },
--task 7025 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=702531,},
  [2]={tp=tk.complete_task,id=7025,text=702532,},
 },
--task 7026 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=702621,},
  [2]={tp=tk.page,id=4,text=702622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=702623,},
  [2]={tp=tk.accept_task,id=7026,text=702624,},
 },
--task 7027 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=702731,},
  [2]={tp=tk.complete_task,id=7027,text=702732,},
 },
--task 7028 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=702821,},
  [2]={tp=tk.page,id=7,text=702822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=702823,},
  [2]={tp=tk.accept_task,id=7028,text=702824,},
 },
--task 7026 uncomplete_talk
 [8]=
 {
  [1]={tp=tk.text,text=702641,},
  [2]={tp=tk.fun,fun="shuaguai",text=702642,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]