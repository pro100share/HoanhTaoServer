--单个npc对话:npc_10071006.lua
local npc_id=10071006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100611,},
  [2]={tp=tk.accept_check,id={6012,6013,6014,6019,6023,6025},},
  [3]={tp=tk.complete_check,id={6011,6012,6013,6018,6022,6024},},
  [4]={tp=tk.close,text=1,},
 },
--task 6011 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=601131,},
  [2]={tp=tk.complete_task,id=6011,text=601132,},
 },
--task 6012 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=601221,},
  [2]={tp=tk.page,id=4,text=601222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=601223,},
  [2]={tp=tk.page,id=23,text=601224,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=601225,},
  [2]={tp=tk.accept_task,id=6012,text=601226,},
 },
--task 6012 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=601231,},
  [2]={tp=tk.complete_task,id=6012,text=601232,},
 },
--task 6013 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=601321,},
  [2]={tp=tk.page,id=7,text=601322,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=601323,},
  [2]={tp=tk.accept_task,id=6013,text=601324,},
 },
--task 6013 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=601331,},
  [2]={tp=tk.complete_task,id=6013,text=601332,},
 },
--task 6014 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=601421,},
  [2]={tp=tk.page,id=10,text=601422,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=601423,},
  [2]={tp=tk.accept_task,id=6014,text=601424,},
 },
--task 6022 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=602231,},
  [2]={tp=tk.complete_task,id=6022,text=602232,},
 },
--task 6023 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=602321,},
  [2]={tp=tk.page,id=19,text=602322,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=602323,},
  [2]={tp=tk.accept_task,id=6023,text=602324,},
 },
--task 6024 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=602431,},
  [2]={tp=tk.complete_task,id=6024,text=602432,},
 },
--task 6025 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=602521,},
  [2]={tp=tk.page,id=22,text=602522,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=602523,},
  [2]={tp=tk.accept_task,id=6025,text=602524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  