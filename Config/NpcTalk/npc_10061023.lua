--单个npc对话:npc_10061023.lua
local npc_id=10061023
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006102311,},
  [2]={tp=tk.accept_check,id={5045,5046,5047,5049},},
  [3]={tp=tk.complete_check,id={5044,5045,5046,5048},},
  [8]={tp=tk.close,text=1,},
 },
--task 5044 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=504431,},
  [2]={tp=tk.complete_task,id=5044,text=504432,},
 },
--task 5045 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=504521,},
  [2]={tp=tk.page,id=4,text=504522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=504523,},
  [2]={tp=tk.page,id=14,text=504524,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=504525,},
  [2]={tp=tk.accept_task,id=5045,text=504526,},
 },
--task 5045 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=504531,},
  [2]={tp=tk.complete_task,id=5045,text=504532,},
 },
--task 5046 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=504621,},
  [2]={tp=tk.accept_task,id=5046,text=504622,},
 },
	-- [7]=
	-- {
	 -- [1]={tp=tk.text,text=504623,},
	 -- [2]={tp=tk.accept_task,id=5046,text=504624,},
	-- },
--task 5046 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=504631,},
  [2]={tp=tk.complete_task,id=5046,text=504632,},
 },
--task 5047 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=504721,},
  [2]={tp=tk.page,id=10,text=504722,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=504723,},
  [2]={tp=tk.accept_task,id=5047,text=504724,},
 },
--task 5048 complete_talk
	[11]=
	{
	 [1]={tp=tk.text,text=504831,},
	 [2]={tp=tk.complete_task,id=5048,text=504832,},
	},
--task 5049 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=504921,},
  [2]={tp=tk.page,id=13,text=504922,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=504923,},
  [2]={tp=tk.accept_task,id=5049,text=504924,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]