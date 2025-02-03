--单个npc对话:npc_10111009.lua
local npc_id=10111009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100911,},
  [2]={tp=tk.accept_check,id={10022,10023,10031},},
  [3]={tp=tk.complete_check,id={10021,10022,10030},},
  [8]={tp=tk.close,text=1,},
 },
--task 10021 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1002131,},
  [2]={tp=tk.complete_task,id=10021,text=1002132,},
 },
--task 10022 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1002221,},
  [2]={tp=tk.accept_task,id=10022,text=1002222,},
 },
--task 10022 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=1002231,},
  [2]={tp=tk.complete_task,id=10022,text=1002232,},
 }, 
--task 10023 accept_talk 
 [5]=
 {
  [1]={tp=tk.text,text=1002321,},
  [2]={tp=tk.page,id=6,text=1002322,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=1002323,},
  [2]={tp=tk.accept_task,id=10023,text=1002324,},
 },
--task 10030 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1003031,},
  [2]={tp=tk.complete_task,id=10030,text=1003032,},
 },
--task 10031 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1003121,},
  [2]={tp=tk.page,id=9,text=1003122,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=1003123,},
  [2]={tp=tk.accept_task,id=10031,text=1003124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]