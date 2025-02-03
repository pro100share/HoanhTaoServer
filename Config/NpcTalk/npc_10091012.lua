--单个npc对话:npc_10091012.lua
local npc_id=10091012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009101211,},
  [2]={tp=tk.accept_check,id={7029,7030,7032},},
  [3]={tp=tk.complete_check,id={7028,7029,7031},},
  [4]={tp=tk.close,text=1,},
 },
--task 7028 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=702831,},
  [2]={tp=tk.complete_task,id=7028,text=702832,},
 },
--task 7029 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=702921,},
  [2]={tp=tk.page,id=4,text=702922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=702923,},
  [2]={tp=tk.accept_task,id=7029,text=702924,},
 },
--task 7029 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=702931,},
  [2]={tp=tk.complete_task,id=7029,text=702932,},
 },
--task 7030 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=703021,},
  [2]={tp=tk.page,id=7,text=703022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=703023,},
  [2]={tp=tk.accept_task,id=7030,text=703024,},
 },
--task 7031 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=703131,},
  [2]={tp=tk.complete_task,id=7031,text=703132,},
 },
--task 7032 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=703221,},
  [2]={tp=tk.page,id=10,text=703222,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=703223,},
  [2]={tp=tk.page,id=11,text=703224,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=703225,},
  [2]={tp=tk.accept_task,id=7032,text=703226,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]