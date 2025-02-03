--单个npc对话:npc_10081005.lua
local npc_id=10081005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100511,},
  [2]={tp=tk.accept_check,id={8024,8026,8027,8028},},
  [3]={tp=tk.complete_check,id={8023,8025,8026,8027},},
  [4]={tp=tk.close,text=1,},
 },
--task 8023 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=802331,},
  [2]={tp=tk.complete_task,id=8023,text=802332,},
 },
--task 8024 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=802421,},
  [2]={tp=tk.page,id=4,text=802422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=802423,},
  [2]={tp=tk.page,id=5,text=802424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=802425,},
  [2]={tp=tk.accept_task,id=8024,text=802426,},
 },
--task 8025 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=802531,},
  [2]={tp=tk.complete_task,id=8025,text=802532,},
 },
--task 8026 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=802621,},
  [2]={tp=tk.page,id=8,text=802622,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=802623,},
  [2]={tp=tk.page,id=18,text=802624,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=802625,},
  [2]={tp=tk.accept_task,id=8026,text=802626,},  
 },
--task 8026 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=802631,},
  [2]={tp=tk.complete_task,id=8026,text=802632,},
 },
--task 8027 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=802721,},
  [2]={tp=tk.page,id=11,text=802722,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=802723,},
  [2]={tp=tk.accept_task,id=8027,text=802724,},
 },
--task 8027 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=802731,},
  [2]={tp=tk.complete_task,id=8027,text=802732,},
 },
--task 8028 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=802821,},
  [2]={tp=tk.page,id=14,text=802822,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=802823,},
  [2]={tp=tk.page,id=19,text=802824,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=802825,},
  [2]={tp=tk.accept_task,id=8028,text=802826,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]