--单个npc对话:npc_10051002.lua
local npc_id=10051002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100211,},
  [2]={tp=tk.accept_check,id={4107,4017,4018,4020,4021,4024},},
  [3]={tp=tk.complete_check,id={4107,4016,4017,4019,4020,4037},},
  [8]={tp=tk.close,text=1,},
 },
--task 4107 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=410721,},
  [2]={tp=tk.page,id=3,text=410722,},
 },
 [3]=
 {
  [1]={tp=tk.text,text=410723,},
  [2]={tp=tk.accept_task,id=4107,text=410724,},
 },
--task 4107 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=410731,},
  [2]={tp=tk.complete_task,id=4107,text=410732,},
 },
--task 4016 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=401631,},
  [2]={tp=tk.complete_task,id=4016,text=401632,},
 },
--task 4017 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=401721,},
  [2]={tp=tk.page,id=7,text=401722,},
 },
	[7]=
	{
	 [1]={tp=tk.text,text=401723,},
	 [2]={tp=tk.page,id=23,text=401724,},
	},
	[23]=
	{
	 [1]={tp=tk.text,text=401725,},
	 [2]={tp=tk.accept_task,id=4017,text=401726,},
	},
--task 4017 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=401731,},
  [2]={tp=tk.complete_task,id=4017,text=401732,},
 },
--task 4018 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=401821,},
  [2]={tp=tk.page,id=10,text=401822,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=401823,},
  [2]={tp=tk.page,id=11,text=401824,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=401825,},
  [2]={tp=tk.accept_task,id=4018,text=401826,},
 },
--task 4019 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=401931,},
  [2]={tp=tk.complete_task,id=4019,text=401932,},
 },
--task 4020 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=402021,},
  [2]={tp=tk.page,id=16,text=402022,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=402023,},
  [2]={tp=tk.page,id=24,text=402024,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=402025,},
  [2]={tp=tk.accept_task,id=4020,text=402026,},
 },
--task 4020 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=402031,},
  [2]={tp=tk.complete_task,id=4020,text=402032,},
 },
--task 4021 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=402121,},
  [2]={tp=tk.page,id=19,text=402122,},
 },
	[19]=
	{
	 [1]={tp=tk.text,text=402123,},
	 [2]={tp=tk.accept_task,id=4021,text=402124,},
	},
--task 4037 complete_talk
 [20]=
 {
  [1]={tp=tk.text,text=403731,},
  [2]={tp=tk.complete_task,id=4037,text=403732,},
 },
--task 4024 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=402421,},
  [2]={tp=tk.page,id=22,text=402422,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=402423,},
  [2]={tp=tk.accept_task,id=4024,text=402424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]