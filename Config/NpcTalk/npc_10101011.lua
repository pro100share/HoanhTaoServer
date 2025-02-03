--单个npc对话:npc_10101011.lua
local npc_id=10101011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101111,},
  [2]={tp=tk.accept_check,id={9038,9062,9067,},},
  [3]={tp=tk.complete_check,id={9037,9061,9066,},},
  [8]={tp=tk.close,text=1,},
 },
--task 9037 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=903731,},
  [2]={tp=tk.complete_task,id=9037,text=903732,},
 },
--task 9038 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=903821,},
  [2]={tp=tk.page,id=4,text=903822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=903823,},
  [2]={tp=tk.accept_task,id=9038,text=903824,},
 },
--task 9061 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=906131,},
  [2]={tp=tk.complete_task,id=9061,text=906132,},
 },
--task 9062 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=906221,},
  [2]={tp=tk.page,id=7,text=906222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=906223,},
  [2]={tp=tk.accept_task,id=9062,text=906224,},
 },
--task 9066 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=906631,},
  [2]={tp=tk.complete_task,id=9066,text=906632,},
 },
--task 9067 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=906721,},
  [2]={tp=tk.page,id=10,text=906722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=906723,},
  [2]={tp=tk.accept_task,id=9067,text=906724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]