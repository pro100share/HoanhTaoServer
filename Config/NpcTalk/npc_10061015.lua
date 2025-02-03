--单个npc对话:npc_10061015.lua
local npc_id=10061015
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006101511,},
  [2]={tp=tk.accept_check,id={5019,5020,5021,5023,5027,5029,5033},},
  [3]={tp=tk.complete_check,id={5018,5019,5020,5022,5026,5028,5029},},
  [8]={tp=tk.close,text=1,},
 },
--task 5018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=501831,},
  [2]={tp=tk.complete_task,id=5018,text=501832,},
 },
--task 5019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=501921,},
  [2]={tp=tk.page,id=4,text=501922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=501923,},
  [2]={tp=tk.accept_task,id=5019,text=501924,},
 },
--task 5019 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=501931,},
  [2]={tp=tk.complete_task,id=5019,text=501932,},
 },
--task 5020 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=502021,},
  [2]={tp=tk.page,id=7,text=502022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=502023,},
  [2]={tp=tk.accept_task,id=5020,text=502024,},
 },
--task 5020 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=502031,},
  [2]={tp=tk.complete_task,id=5020,text=502032,},
 },
--task 5021 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=502121,},
  [2]={tp=tk.page,id=10,text=502122,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=502123,},
  [2]={tp=tk.accept_task,id=5021,text=502124,},
 },
--task 5022 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=502231,},
  [2]={tp=tk.complete_task,id=5022,text=502232,},
 },
--task 5023 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=502321,},
  [2]={tp=tk.page,id=13,text=502322,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=502323,},
  [2]={tp=tk.accept_task,id=5023,text=502324,},
 },
--task 5026 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=502631,},
  [2]={tp=tk.complete_task,id=5026,text=502632,},
 },
--task 5027 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=502721,},
  [2]={tp=tk.page,id=16,text=502722,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=502723,},
  [2]={tp=tk.accept_task,id=5027,text=502724,},
 },
--task 5028 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=502831,},
  [2]={tp=tk.complete_task,id=5028,text=502832,},
 },
--task 5029 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=502921,},
  [2]={tp=tk.page,id=19,text=502922,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=502923,},
  [2]={tp=tk.accept_task,id=5029,text=502924,},
 },
--task 5029 complete_talk
 [23]=
 {
  [1]={tp=tk.text,text=502931,},
  [2]={tp=tk.complete_task,id=5029,text=502932,},
 },
-- --task 5033 complete_talk
 -- [20]=
 -- {
  -- [1]={tp=tk.text,text=503331,},
  -- [2]={tp=tk.complete_task,id=5033,text=503332,},
 -- },
--task 5033 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=503321,},
  [2]={tp=tk.accept_task,id=5033,text=503322,},
 },
 -- [22]=
 -- {
  -- [1]={tp=tk.text,text=503423,},
  -- [2]={tp=tk.accept_task,id=5034,text=503424,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]