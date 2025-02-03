--单个npc对话:npc_10071202.lua
local npc_id=10071202
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007120211,},
  [2]={tp=tk.accept_check,id={6204,6205,6206},},
  [3]={tp=tk.complete_check,id={6204,6205,6206},},
  [8]={tp=tk.close,text=1,},
 },
--task 6204 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=620421,},
  [2]={tp=tk.accept_task,id=6204,text=620422,},
 },
--task 6204 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=620431,},
  [2]={tp=tk.complete_task,id=6204,text=620432,},
 },
--task 6205 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=620521,},
  [2]={tp=tk.accept_task,id=6205,text=620522,},
 },
--task 6205 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=620531,},
  [2]={tp=tk.complete_task,id=6205,text=620532,},
 },
--task 6206 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=620621,},
  [2]={tp=tk.accept_task,id=6206,text=620622,},
 },
--task 6206 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=620631,},
  [2]={tp=tk.complete_task,id=6206,text=620632,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 