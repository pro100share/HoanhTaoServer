--单个npc对话:npc_10041004.lua
local npc_id=10041004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100411,},
  [2]={tp=tk.accept_check,id={3006,3007,3012,3024},},
  [3]={tp=tk.complete_check,id={3005,3006,3011,3023},},
  [8]={tp=tk.close,text=1,},
 },
--task 3005 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=300531,},
  [2]={tp=tk.complete_task,id=3005,text=300532,},
 },
--task 3006 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=300621,},
  [2]={tp=tk.accept_task,id=3006,text=300622,},
 },
--task 3006 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=300631,},
  [2]={tp=tk.complete_task,id=3006,text=300632,},
 },
--task 3007 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=300721,},
  [2]={tp=tk.page,id=6,text=300722,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=300723,},
  [2]={tp=tk.accept_task,id=3007,text=300724,},
 },
--task 3011 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=301131,},
  [2]={tp=tk.complete_task,id=3011,text=301132,},
 },
--task 3012 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=301221,},
  [2]={tp=tk.page,id=9,text=301222,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=301223,},
  [2]={tp=tk.accept_task,id=3012,text=301224,},
 },
--task 3023 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=302331,},
  [2]={tp=tk.complete_task,id=3023,text=302332,},
 },
--task 3024 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=302421,},
  [2]={tp=tk.page,id=12,text=302422,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=302423,},
  [2]={tp=tk.page,id=13,text=302424,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=302425,},
  [2]={tp=tk.accept_task,id=3024,text=302426,},
 },
--task 3101 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=310121,},
  [2]={tp=tk.page,id=27,text=310122,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=310123,},
  [2]={tp=tk.accept_task,id=3101,text=310124,},
 },
--task 3101 complete_talk
 [28]=
 {
  [1]={tp=tk.text,text=310131,},
  [2]={tp=tk.page,id=29,text=310132,},
 },
 [29]=
 {
  [1]={tp=tk.text,text=310133,},
  [2]={tp=tk.page,id=30,text=310134,},
 },
 [30]=
 {
  [1]={tp=tk.text,text=310135,},
  [2]={tp=tk.complete_task,id=3101,text=310136,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]