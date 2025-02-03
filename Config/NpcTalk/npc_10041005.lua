--单个npc对话:npc_10041005.lua
local npc_id=10041005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100511,},
  [2]={tp=tk.accept_check,id={3008,3009,3010},},
  [3]={tp=tk.complete_check,id={3007,3008,3009},},
  [8]={tp=tk.close,text=1,},
 },
--task 3007 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=300731,},
  [2]={tp=tk.complete_task,id=3007,text=300732,},
 },
--task 3008 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=300821,},
  [2]={tp=tk.page,id=4,text=300822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=300823,},
  [2]={tp=tk.page,id=5,text=300824,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=300825,},
  [2]={tp=tk.accept_task,id=3008,text=300826,},
 },
--task 3008 complete_talk
[6]=
 {
  [1]={tp=tk.text,text=300831,},
  --[2]={tp=tk.page,id=10,text=300841,},
  [3]={tp=tk.page,id=10,text=300842,},
  [4]={tp=tk.page,id=10,text=300843,},
  [5]={tp=tk.page,id=7,level=2,text=300844,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=300832,},
  [2]={tp=tk.page,id=10,text=300845,},
  [3]={tp=tk.page,id=10,text=300846,},
  [4]={tp=tk.page,id=8,level=2,text=300847,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=300833,},
  [2]={tp=tk.complete_task,id=3008,text=300834,},
 },
--uncomplete_talk
 [10]=
 {
  [1]={tp=tk.text,text=300848,},
  [2]={tp=tk.page,id=6,text=300849,},
 },
--task 3009 accept_talk
 [11]=
 {
  [1]={tp=tk.text,text=300921,},
  [2]={tp=tk.page,id=12,text=300922,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=300923,},
  [2]={tp=tk.accept_task,id=3009,text=300924,},
 },
--task 3009 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=300931,},
  [2]={tp=tk.complete_task,id=3009,text=300932,},
 },
--task 3010 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=301021,},
  [2]={tp=tk.page,id=16,text=301022,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=301023,},
  [2]={tp=tk.accept_task,id=3010,text=301024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]