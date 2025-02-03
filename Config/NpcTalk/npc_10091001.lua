--单个npc对话:npc_10091001.lua
local npc_id=10091001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009100111,},
  [2]={tp=tk.accept_check,id={7004,7006},},
  [3]={tp=tk.complete_check,id={7003,7005},},
  [4]={tp=tk.close,text=1,},
 },
--task 7003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=700331,},
  [2]={tp=tk.complete_task,id=7003,text=700332,},
 },
--task 7004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=700421,},
  [2]={tp=tk.page,id=4,text=700422,},
 },
	[4]=
	{
	 [1]={tp=tk.text,text=700423,},
	 [2]={tp=tk.accept_task,id=7004,text=700424,},
	},
--task 7005 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=700531,},
  [2]={tp=tk.complete_task,id=7005,text=700532,},
 },
--task 7006 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=700621,},
  [2]={tp=tk.page,id=7,text=700622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=700623,},
  [2]={tp=tk.accept_task,id=7006,text=700624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]