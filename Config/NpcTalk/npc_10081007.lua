--单个npc对话:npc_10081007.lua
local npc_id=10081007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100711,},
  [2]={tp=tk.accept_check,id={8061,8062,8066,8071},},
  [3]={tp=tk.complete_check,id={8060,8061,8065,8070},},
  [4]={tp=tk.close,text=1,},
 },
--task 8060 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=806031,},
  [2]={tp=tk.complete_task,id=8060,text=806032,},
 },
--task 8061 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=806121,},
  [2]={tp=tk.page,id=4,text=806122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=806123,},
  [2]={tp=tk.accept_task,id=8061,text=806124,},
 },
--task 8061 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=806131,},
  [2]={tp=tk.complete_task,id=8061,text=806132,},
 },
--task 8062 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=806221,},
  [2]={tp=tk.page,id=8,text=806222,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=806223,},
  [2]={tp=tk.accept_task,id=8062,text=806224,},
 },
--task 8065 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=806531,},
  [2]={tp=tk.complete_task,id=8065,text=806532,},
 },
--task 8066 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=806621,},
  [2]={tp=tk.page,id=11,text=806622,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=806623,},
  [2]={tp=tk.accept_task,id=8066,text=806624,},
 },
--task 8070 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=807031,},
  [2]={tp=tk.complete_task,id=8070,text=807032,},
 },
--task 8071 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=807121,},
  [2]={tp=tk.page,id=14,text=807122,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=807123,},
  [2]={tp=tk.accept_task,id=8071,text=807124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]