--单个npc对话:npc_10081004.lua
local npc_id=10081004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100411,},
  [2]={tp=tk.accept_check,id={8016,8017,8068},},
  [3]={tp=tk.complete_check,id={8015,8016,8067},},
  [4]={tp=tk.close,text=1,},
 },
--task 8015 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=801531,},
  [2]={tp=tk.complete_task,id=8015,text=801532,},
 }, 
--task 8016 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=801621,},
  [2]={tp=tk.page,id=4,text=801622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=801623,},
  [2]={tp=tk.page,id=5,text=801624,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=801625,},
  [2]={tp=tk.accept_task,id=8016,text=801626,},
 },
--task 8016 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=801631,},
  [2]={tp=tk.complete_task,id=8016,text=801632,},
 },
--task 8017 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=801721,},
  [2]={tp=tk.page,id=8,text=801722,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=801723,},
  [2]={tp=tk.accept_task,id=8017,text=801724,},
 },
--task 8067 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=806731,},
  [2]={tp=tk.complete_task,id=8067,text=806732,},
 },
--task 8068 accept_talk 
 [10]=
 {
  [1]={tp=tk.text,text=806821,},
  [2]={tp=tk.page,id=11,text=806822,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=806823,},
  [2]={tp=tk.accept_task,id=8068,text=806824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]