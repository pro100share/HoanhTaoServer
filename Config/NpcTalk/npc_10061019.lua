--单个npc对话:npc_10061019.lua
local npc_id=10061019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006101911,},
  [2]={tp=tk.accept_check,id={5017,5018},},
  [3]={tp=tk.complete_check,id={5016,5017},},
  [8]={tp=tk.close,text=1,},
 },
--task 5016 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=501631,},
  [2]={tp=tk.complete_task,id=5016,text=501632,},
 },
--task 5017 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=501721,},
  [2]={tp=tk.page,id=4,text=501722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=501723,},
  [2]={tp=tk.page,id=5,text=501724,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=501725,},
  [2]={tp=tk.accept_task,id=5017,text=501726,},
 },
--task 5017 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=501731,},
  [2]={tp=tk.complete_task,id=5017,text=501732,},
 },
--task 5018 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=501821,},
  [2]={tp=tk.page,id=8,text=501822,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=501823,},
  [2]={tp=tk.page,id=9,text=501824,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=501825,},
  [2]={tp=tk.accept_task,id=5018,text=501826,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]