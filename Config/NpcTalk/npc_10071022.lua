--单个npc对话:npc_10071022.lua
local npc_id=10071022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007102211,},
  [2]={tp=tk.accept_check,id={6044,6045,6046,6053,6054},},
  [3]={tp=tk.complete_check,id={6043,6044,6045,6052,6053},},
  [4]={tp=tk.close,text=1,},
 },
--task 6043 complete_talk
 [8]=
	{
	 [1]={tp=tk.text,text=604331,},
	 [2]={tp=tk.complete_task,id=6043,text=604332,},
	}, 
--task 6044 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=604421,},
  [2]={tp=tk.page,id=10,text=604422,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=604423,},
  [2]={tp=tk.accept_task,id=6044,text=604424,},
 },
--task 6044 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=604431,},
  [2]={tp=tk.complete_task,id=6044,text=604432,},
 },
--task 6045 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=604521,},
  [2]={tp=tk.page,id=4,text=604522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=604523,},
  [2]={tp=tk.accept_task,id=6045,text=604524,},
 },
--task 6045 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=604531,},
  [2]={tp=tk.complete_task,id=6045,text=604532,},
 },
--task 6046 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=604621,},
  [2]={tp=tk.page,id=7,text=604622,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=604623,},
  [2]={tp=tk.accept_task,id=6046,text=604624,},
 },
--task 6052 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=605231,},
  [2]={tp=tk.complete_task,id=6052,text=605232,},
 },
--task 6053 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=605321,},
  [2]={tp=tk.accept_task,id=6053,text=605322,},
 },
 -- [13]=
 -- {
  -- [1]={tp=tk.text,text=605323,},
  -- [2]={tp=tk.accept_task,id=6053,text=605324,},
 -- },
--task 6053 complete_talk
 [14]=
	{
	 [1]={tp=tk.text,text=605331,},
	 [2]={tp=tk.complete_task,id=6053,text=605332,},
	},
--task 6054 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=605421,},
  [2]={tp=tk.page,id=16,text=605422,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=605423,},
  [2]={tp=tk.accept_task,id=6054,text=605424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  