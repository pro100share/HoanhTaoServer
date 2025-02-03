--单个npc对话:npc_10071009.lua
local npc_id=10071009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100911,},
  [2]={tp=tk.accept_check,id={6004,6005,6006},},
  [3]={tp=tk.complete_check,id={6003,6004,6005},},
  [4]={tp=tk.close,text=1,},
 },
--task 6003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=600331,},
  [2]={tp=tk.complete_task,id=6003,text=600332,},
 },
--task 6004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=600421,},
  [2]={tp=tk.page,id=4,text=600422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=600423,},
  [2]={tp=tk.page,id=5,text=600424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=600425,},
  [2]={tp=tk.accept_task,id=6004,text=600426,},
 },
--task 6004 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=600431,},
  [2]={tp=tk.complete_task,id=6004,text=600432,},
 },
--task 6005 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=600521,},
  [2]={tp=tk.page,id=8,text=600522,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=600523,},
  [2]={tp=tk.accept_task,id=6005,text=600524,},
 },
--task 6005 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=600531,},
  [2]={tp=tk.complete_task,id=6005,text=600532,},
 },
--task 6006 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=600621,},
  [2]={tp=tk.page,id=11,text=600622,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=600623,},
  [2]={tp=tk.accept_task,id=6006,text=600624,},
 },
-- --task 6034 complete_talk
 -- [12]=
 -- {
  -- [1]={tp=tk.text,text=603431,},
  -- [2]={tp=tk.complete_task,id=6034,text=603432,},
 -- },
-- --task 6035 accept_talk
 -- [13]=
 -- {
  -- [1]={tp=tk.text,text=603521,},
  -- [2]={tp=tk.page,id=14,text=603522,},
 -- },
 -- [14]=
 -- {
  -- [1]={tp=tk.text,text=603523,},
  -- [2]={tp=tk.page,id=15,text=603524,},
 -- },
 -- [15]=
 -- {
  -- [1]={tp=tk.text,text=603525,},
  -- [2]={tp=tk.accept_task,id=6035,text=603526,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  