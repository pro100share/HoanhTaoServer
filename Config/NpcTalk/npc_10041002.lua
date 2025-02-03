--单个npc对话:npc_10041002.lua
local npc_id=10041002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100211,},
  [2]={tp=tk.accept_check,id={3003,3004,3005},},
  [3]={tp=tk.complete_check,id={3002,3003,3004},},
  [8]={tp=tk.close,text=1,},
 },
--task 3002 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=300231,},
  [2]={tp=tk.complete_task,id=3002,text=300232,},
 },
--task 3003 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=300321,},
  [2]={tp=tk.page,id=4,text=300322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=300323,},
  [2]={tp=tk.page,id=5,text=300324,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=300325,},
  [2]={tp=tk.accept_task,id=3003,text=300326,},
 },
--task 3003 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=300331,},
  [2]={tp=tk.complete_task,id=3003,text=300332,},
 },
--task 3004 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=300421,},
  [2]={tp=tk.page,id=8,text=300422,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=300423,},
  [2]={tp=tk.page,id=9,text=300424,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=300425,},
  [2]={tp=tk.accept_task,id=3004,text=300426,},
 },
--task 3004 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=300431,},
  [2]={tp=tk.complete_task,id=3004,text=300432,},
 },
--task 3005 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=300521,},
  [2]={tp=tk.page,id=12,text=300522,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=300523,},
  [2]={tp=tk.accept_task,id=3005,text=300524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 