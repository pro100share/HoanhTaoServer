--单个npc对话:npc_10061018.lua
local npc_id=10061018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006101811,},
  [2]={tp=tk.accept_check,id={5013,5014,5054},},
  [3]={tp=tk.complete_check,id={5012,5013,5018},},
  [8]={tp=tk.close,text=1,},
 },
--task 5012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=501231,},
  [2]={tp=tk.complete_task,id=5012,text=501232,},
 },
--task 5013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=501321,},
  [2]={tp=tk.accept_task,id=5013,text=501322,},
 },
--task 5013 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=501331,},
  [2]={tp=tk.complete_task,id=5013,text=501332,},
 },
--task 5014 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=501421,},
  [2]={tp=tk.page,id=6,text=501422,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=501423,},
  [2]={tp=tk.accept_task,id=5014,text=501424,},
 },
--task 5018 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=501831,},
  [2]={tp=tk.complete_task,id=5018,text=501832,},
 },
--task 5054 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=505421,},
  [2]={tp=tk.page,id=9,text=505422,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=505423,},
  [2]={tp=tk.page,id=10,text=505424,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=505425,},
  [2]={tp=tk.accept_task,id=5054,text=505426,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]