--单个npc对话:npc_10051004.lua
local npc_id=10051004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100411,},
  [2]={tp=tk.accept_check,id={4001,4002,4003,4004},},
  [3]={tp=tk.complete_check,id={3042,4001,4002,4003},},
  [8]={tp=tk.close,text=1,},
 },
--task 3042 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=303731,},
  [2]={tp=tk.complete_task,id=3042,text=303732,},
 },
--task 4001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=400121,},
  [2]={tp=tk.page,id=4,text=400122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=400123,},
  [2]={tp=tk.page,id=13,text=400124,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=400125,},
  [2]={tp=tk.accept_task,id=4001,text=400126,},
 },
--task 4001 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=400131,},
  [2]={tp=tk.complete_task,id=4001,text=400132,},
 },
--task 4002 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=400221,},
  [2]={tp=tk.page,id=7,text=400222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=400223,},
  [2]={tp=tk.accept_task,id=4002,text=400224,},
 },
--task 4002 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=400231,},
  [2]={tp=tk.complete_task,id=4002,text=400232,},
 },
--task 4003 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=400321,},
  [2]={tp=tk.page,id=10,text=400322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=400323,},
  [2]={tp=tk.accept_task,id=4003,text=400324,},
 },
--task 4003 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=400331,},
  [2]={tp=tk.complete_task,id=4003,text=400332,},
 },
--task 4004 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=400421,},
  [2]={tp=tk.accept_task,id=4004,text=400422,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]