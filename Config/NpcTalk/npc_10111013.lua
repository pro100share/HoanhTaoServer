--单个npc对话:npc_10111013.lua
local npc_id=10111013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101311,},
  [2]={tp=tk.accept_check,id={10034,10035,10036,10038},},
  [3]={tp=tk.complete_check,id={10033,10034,10035,10037},},
  [8]={tp=tk.close,text=1,},
 },
--task 10033 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1003331,},
  [2]={tp=tk.complete_task,id=10033,text=1003332,},
 },
--task 10034 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1003421,},
  [2]={tp=tk.page,id=4,text=1003422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1003423,},
  [2]={tp=tk.page,id=5,text=1003424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1003425,},
  [2]={tp=tk.accept_task,id=10034,text=1003426,},
 },
--task 10034 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1003431,},
  [2]={tp=tk.complete_task,id=10034,text=1003432,},
 },
--task 10035 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1003521,},
  [2]={tp=tk.accept_task,id=10035,text=1003522,},
 },
--task 10035 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1003531,},
  [2]={tp=tk.complete_task,id=10035,text=1003532,},
 },
--task 10036 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1003621,},
  [2]={tp=tk.page,id=10,text=1003622,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1003623,},
  [2]={tp=tk.accept_task,id=10036,text=1003624,},
 },
--task 10037 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1003731,},
  [2]={tp=tk.complete_task,id=10037,text=1003732,},
 },
--task 10038 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1003821,},
  [2]={tp=tk.page,id=13,text=1003822,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1003823,},
  [2]={tp=tk.accept_task,id=10038,text=1003824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]