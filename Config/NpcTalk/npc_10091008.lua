--单个npc对话:npc_10091008.lua
local npc_id=10091008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100811,},
  [2]={tp=tk.accept_check,id={7014,7015,7034,7035},},
  [3]={tp=tk.complete_check,id={7013,7014,7033,7034},},
  [4]={tp=tk.close,text=1,},
 },
--task 7013 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=701331,},
  [2]={tp=tk.complete_task,id=7013,text=701332,},
 },
--task 7014 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=701421,},
  [2]={tp=tk.page,id=4,text=701422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=701423,},
  [2]={tp=tk.accept_task,id=7014,text=701424,},
 },
--task 7014 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=701431,},
  [2]={tp=tk.complete_task,id=7014,text=701432,},
 },
--task 7015 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=701521,},
  [2]={tp=tk.accept_task,id=7015,text=701522,},
 },
--task 7033 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=703331,},
  [2]={tp=tk.complete_task,id=7033,text=703332,},
 },
--task 7034 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=703421,},
  [2]={tp=tk.page,id=9,text=703422,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=703423,},
  [2]={tp=tk.page,id=10,text=703424,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=703425,},
  [2]={tp=tk.accept_task,id=7034,text=703426,},
 },
--task 7034 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=703431,},
  [2]={tp=tk.complete_task,id=7034,text=703432,},
 },
--task 7035 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=703521,},
  [2]={tp=tk.accept_task,id=7035,text=703522,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]