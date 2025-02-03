--单个npc对话:npc_10041008.lua
local npc_id=10041008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100811,},
  [2]={tp=tk.accept_check,id={3026,3027,3028,3029},},
  [3]={tp=tk.complete_check,id={3025,3040,3027,3028},},
  [8]={tp=tk.close,text=1,},
 },
--task 3025 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=302531,},
  [2]={tp=tk.complete_task,id=3025,text=302532,},
 },
--task 3026 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=302621,},
  [2]={tp=tk.page,id=4,text=302622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=302623,},
  [2]={tp=tk.page,id=5,text=302624,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=302625,},
  [2]={tp=tk.accept_task,id=3026,text=302626,},
 },
--task 3039 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=304031,},
  [2]={tp=tk.complete_task,id=3040,text=304032,},
 },
--task 3027 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=302721,},
  [2]={tp=tk.page,id=8,text=302722,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=302723,},
  [2]={tp=tk.accept_task,id=3027,text=302724,},
 },
--task 3027 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=302731,},
  [2]={tp=tk.complete_task,id=3027,text=302732,},
 },
--task 3028 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=302821,},
  [2]={tp=tk.accept_task,id=3028,text=302822,},
 },
--task 3028 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=302831,},
  [2]={tp=tk.complete_task,id=3028,text=302832,},
 },
--task 3029 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=302921,},
  [2]={tp=tk.page,id=14,text=302922,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=302923,},
  [2]={tp=tk.accept_task,id=3029,text=302924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]