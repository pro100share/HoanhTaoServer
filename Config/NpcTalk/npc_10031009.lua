--单个npc对话:npc_10031009.lua
local npc_id=10031009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100911,},
  [2]={tp=tk.accept_check,id={2020,2021},},
  [3]={tp=tk.complete_check,id={2019,2020},},
  [4]={tp=tk.close,text=1,},
 },
--task 2019 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=201931,},
  [2]={tp=tk.complete_task,id=2019,text=201932,},
 },
--task 2020 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=202021,},
  [2]={tp=tk.page,id=4,text=202022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=202023,},
  [2]={tp=tk.accept_task,id=2020,text=202024,},
 },
--task 2020 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=202031,},
  [2]={tp=tk.complete_task,id=2020,text=202032,},
 },
--task 2021 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=202121,},
  [2]={tp=tk.page,id=7,text=202122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=202123,},
  [2]={tp=tk.accept_task,id=2021,text=202124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]