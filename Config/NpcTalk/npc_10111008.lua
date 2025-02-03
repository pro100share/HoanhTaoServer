--单个npc对话:npc_10111008.lua
local npc_id=10111008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100811,},
  [2]={tp=tk.accept_check,id={10016,10017,10018,10020,10021,10040},},
  [3]={tp=tk.complete_check,id={10015,10016,10017,10019,10020,10039},},
  [8]={tp=tk.close,text=1,},
 },
--task 10015 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1001531,},
  [2]={tp=tk.complete_task,id=10015,text=1001532,},
 },
--task 10016 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1001621,},
  [2]={tp=tk.page,id=4,text=1001622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1001623,},
  [2]={tp=tk.accept_task,id=10016,text=1001624,},
 },
--task 10016 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1001631,},
  [2]={tp=tk.complete_task,id=10016,text=1001632,},
 },
--task 10017 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1001721,},
  [2]={tp=tk.accept_task,id=10017,text=1001722,},
 },
--task 10017 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=1001731,},
  [2]={tp=tk.complete_task,id=10017,text=1001732,},
 },
--task 10018 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=1001821,},
  [2]={tp=tk.accept_task,id=10018,text=1001822,},
 },
-- --task 10018 complete_talk
 -- [9]=
 -- {
  -- [1]={tp=tk.text,text=1001831,},
  -- [2]={tp=tk.complete_task,id=10018,text=1001832,},
 -- },
-- --task 10019 accept_talk
 -- [10]=
 -- {
  -- [1]={tp=tk.text,text=1001921,},
  -- [2]={tp=tk.page,id=11,text=1001922,},
 -- },
 -- [11]=
 -- {
  -- [1]={tp=tk.text,text=1001923,},
  -- [2]={tp=tk.accept_task,id=10019,text=1001924,},
 -- },
--task 10019 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=1001931,},
  [2]={tp=tk.complete_task,id=10019,text=1001932,},
 },
--task 10020 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=1002021,},
  [2]={tp=tk.accept_task,id=10020,text=1002022,},
 },
--task 10020 complete_talk
 [15]=
 {
  [1]={tp=tk.text,text=1002031,},
  [2]={tp=tk.complete_task,id=10020,text=1002032,},
 },
--task 10021 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=1002121,},
  [2]={tp=tk.accept_task,id=10021,text=1002122,},
 },
--task 10039 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=1003931,},
  [2]={tp=tk.complete_task,id=10039,text=1003932,},
 }, 
--task 10040 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=1004021,},
  [2]={tp=tk.page,id=22,text=1004022,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=1004023,},
  [2]={tp=tk.accept_task,id=10040,text=1004024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]