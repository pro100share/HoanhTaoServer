--单个npc对话:npc_10051005.lua
local npc_id=10051005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100511,},
  [2]={tp=tk.accept_check,id={4023,4026,4027,4028},},
  [3]={tp=tk.complete_check,id={4022,4024,4026,4027},},
  [8]={tp=tk.close,text=1,},
 },
--task 4022 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=402231,},
  [2]={tp=tk.complete_task,id=4022,text=402232,},
 },
--task 4023 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=402321,},
  [2]={tp=tk.page,id=7,text=402322,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=402323,},
  [2]={tp=tk.page,id=20,text=402324,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=402325,},
  [2]={tp=tk.accept_task,id=4023,text=402326,},  
 },
--task 4024 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=402431,},
  [2]={tp=tk.complete_task,id=4024,text=402432,},
 },
--task 4026 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=402621,},
  [2]={tp=tk.page,id=13,text=402622,},
 },
	[13]=
	{
	 [1]={tp=tk.text,text=402623,},
	 [2]={tp=tk.accept_task,id=4026,text=402624,},
	},
--task 4026 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=402631,},
  [2]={tp=tk.complete_task,id=4026,text=402632,},
 },
--task 4027 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=402721,},
  [2]={tp=tk.accept_task,id=4027,text=402722,},
 },
--task 4027 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=402731,},
  [2]={tp=tk.complete_task,id=4027,text=402732,},
 },
--task 4028 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=402821,},
  [2]={tp=tk.page,id=19,text=402822,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=402823,},
  [2]={tp=tk.accept_task,id=4028,text=402824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]