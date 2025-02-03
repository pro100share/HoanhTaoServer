--单个npc对话:npc_10011015.lua
local npc_id=10011015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001101511,},
  [2]={tp=tk.accept_check,id={1017,1018,1023},},
  [3]={tp=tk.complete_check,id={1016,1017,1022},},
  [8]={tp=tk.close,text=1,},
 },
--task 1016 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=101631,},
  [2]={tp=tk.complete_task,id=1016,text=101632,},
 },
--task 1017 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=101721,},
  [2]={tp=tk.page,id=4,text=101722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101723,},
  [2]={tp=tk.accept_task,id=1017,text=101724,},
 },
--task 1017 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=101731,},
  [2]={tp=tk.complete_task,id=1017,text=101732,},
 },
--task 1018 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=101821,},
  [2]={tp=tk.page,id=7,text=101822,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=101823,},
  [2]={tp=tk.accept_task,id=1018,text=101824,},
 },
--task 1022 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=102231,},
  [2]={tp=tk.complete_task,id=1022,text=102232,},
 },
--task 1023 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=102321,},
  [2]={tp=tk.page,id=10,text=102322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=102323,},
  [2]={tp=tk.accept_task,id=1023,text=102324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]