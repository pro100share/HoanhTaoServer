--单个npc对话:npc_10051010.lua
local npc_id=10051010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005101011,},
  [2]={tp=tk.accept_check,id={4134,4037},},
  [3]={tp=tk.complete_check,id={4134,4023},},
  [8]={tp=tk.close,text=1,},
 },
--task 4023 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=402331,},
  [2]={tp=tk.complete_task,id=4023,text=402332,},
 },
--task 4037 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=403721,},
  [2]={tp=tk.page,id=4,text=403722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=403723,},
  [2]={tp=tk.accept_task,id=4037,text=403724,},
 },
--task 4134 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=413421,},
  [2]={tp=tk.page,id=11,text=413422,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=413423,},
  [2]={tp=tk.accept_task,id=4134,text=413424,},
 },
--task 4034 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=413431,},
  [2]={tp=tk.complete_task,id=4134,text=413432,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]