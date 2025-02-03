--单个npc对话:npc_10101014.lua
local npc_id=10101014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101411,},
  [2]={tp=tk.accept_check,id={9045,9046,9048,9049,9052,9054,9056,9057},},
  [3]={tp=tk.complete_check,id={9044,9045,9046,9047,9048,9051,9053,9055,9056},},
  [8]={tp=tk.close,text=1,},
 },
--task 9044 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=904431,},
  [2]={tp=tk.complete_task,id=9044,text=904432,},
 },
--task 9045 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=904521,},
  [2]={tp=tk.page,id=4,text=904522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=904523,},
  [2]={tp=tk.accept_task,id=9045,text=904524,},
 },
--task 9045 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=904531,},
  [2]={tp=tk.complete_task,id=9045,text=904532,},
 },
--task 9046 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=904621,},
  [2]={tp=tk.page,id=7,text=904622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=904623,},
  [2]={tp=tk.accept_task,id=9046,text=904624,},
 },
--task 9046 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=904631,},
  [2]={tp=tk.complete_task,id=9046,text=904632,},
 },
-- --task 9047 accept_talk 
 -- [9]=
 -- {
  -- [1]={tp=tk.text,text=904721,},
  -- [2]={tp=tk.page,id=10,text=904722,},
 -- },
 -- [10]=
 -- {
  -- [1]={tp=tk.text,text=904723,},
  -- [2]={tp=tk.accept_task,id=9047,text=904724,},
 -- },
--task 9047 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=904731,},
  [2]={tp=tk.complete_task,id=9047,text=904732,},
 },
--task 9048 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=904821,},
  [2]={tp=tk.page,id=13,text=904822,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=904823,},
  [2]={tp=tk.accept_task,id=9048,text=904824,},
 },
--task 9048 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=904831,},
  [2]={tp=tk.complete_task,id=9048,text=904832,},
 },
--task 9049 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=904921,},
  [2]={tp=tk.accept_task,id=9049,text=904922,},
 },
--task 9051 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=905131,},
  [2]={tp=tk.complete_task,id=9051,text=905132,},
 },
--task 9052 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=905221,},
  [2]={tp=tk.page,id=18,text=905222,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=905223,},
  [2]={tp=tk.accept_task,id=9052,text=905224,},
 },
--task 9053 complete_talk
 [19]=
 {
  [1]={tp=tk.text,text=905331,},
  [2]={tp=tk.complete_task,id=9053,text=905332,},
 },
--task 9054 accept_talk
 [20]=
 {
  [1]={tp=tk.text,text=905421,},
  [2]={tp=tk.page,id=21,text=905422,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=905423,},
  [2]={tp=tk.accept_task,id=9054,text=905424,},
 },
--task 9055 complete_talk
 [22]=
 {
  [1]={tp=tk.text,text=905531,},
  [2]={tp=tk.complete_task,id=9055,text=905532,},
 },
--task 9056 accept_talk
 [23]=
 {
  [1]={tp=tk.text,text=905621,},
  [2]={tp=tk.page,id=24,text=905622,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=905623,},
  [2]={tp=tk.accept_task,id=9056,text=905624,},
 },
--task 9056 complete_talk
 [25]=
 {
  [1]={tp=tk.text,text=905631,},
  [2]={tp=tk.complete_task,id=9056,text=905632,},
 },
--task 9057 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=905721,},
  [2]={tp=tk.page,id=27,text=905722,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=905723,},
  [2]={tp=tk.accept_task,id=9057,text=905724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]