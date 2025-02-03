--单个npc对话:npc_10041020.lua
local npc_id=10041020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004102011,},
  [2]={tp=tk.accept_check,id={3030,3039,3033,3034,3036},},
  [3]={tp=tk.complete_check,id={3029,3031,3032,3033,3035},},
  [8]={tp=tk.close,text=1,},
 },
--task 3029 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=302931,},
  [2]={tp=tk.complete_task,id=3029,text=302932,},
 },
--task 3030 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=303021,},
  [2]={tp=tk.page,id=4,text=303022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=303023,},
  [2]={tp=tk.page,id=15,text=303024,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=303025,},
  [2]={tp=tk.accept_task,id=3030,text=303026,},
 },
--task 3031 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=303131,},
  [2]={tp=tk.complete_task,id=3031,text=303132,},
 },
--task 3039 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=303921,},
  [2]={tp=tk.page,id=18,text=303922,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=303923,},
  [2]={tp=tk.accept_task,id=3039,text=303924,},
 },
--task 3032 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=303231,},
  [2]={tp=tk.complete_task,id=3032,text=303232,},
 },
--task 3033 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=303321,},
  [2]={tp=tk.accept_task,id=3033,text=303322,},
 },
--task 3033 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=303331,},
  [2]={tp=tk.complete_task,id=3033,text=303332,},
 },
--task 3034 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=303421,},
  [2]={tp=tk.page,id=10,text=303422,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=303423,},
  [2]={tp=tk.page,id=19,text=303424,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=303425,},
  [2]={tp=tk.accept_task,id=3034,text=303426,},
 },
--task 3034 uncomplete_talk
 [14]=
 {
  [1]={tp=tk.text,text=303427,},
  [2]={tp=tk.enter_dupl,dupl_id=1086,map_id=5086,text=666,},
 }, 
--task 3035 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=303531,},
  [2]={tp=tk.complete_task,id=3035,text=303532,},
 },
--task 3036 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=303621,},
  [2]={tp=tk.accept_task,id=3036,text=303622,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]