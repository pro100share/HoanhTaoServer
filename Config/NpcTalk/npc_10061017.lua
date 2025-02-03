--单个npc对话:npc_10061017.lua
local npc_id=10061017
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006101711,},
  [2]={tp=tk.accept_check,id={5004,5052,5012},},
  [3]={tp=tk.complete_check,id={5003,5004,5011},},
  [8]={tp=tk.close,text=1,},
 },
-- task 5003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=500331,},
  [2]={tp=tk.complete_task,id=5003,text=500332,},
 },
--task 5004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=500421,},
  [2]={tp=tk.page,id=4,text=500422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=500423,},
  [2]={tp=tk.page,id=5,text=500424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=500425,},
  [2]={tp=tk.accept_task,id=5004,text=500426,},
 },
--task 5004 complete_talk
 [6]=
	{
	 [1]={tp=tk.text,text=500431,},
	 [2]={tp=tk.complete_task,id=5004,text=500432,},
	},
--task 5052 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=505221,},
  [2]={tp=tk.page,id=8,text=505222,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=505223,},
  [2]={tp=tk.accept_task,id=5052,text=505224,},
 },
--task 5011 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=501131,},
  [2]={tp=tk.complete_task,id=5011,text=501132,},
 },
--task 5012 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=501221,},
  [2]={tp=tk.page,id=11,text=501222,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=501223,},
  [2]={tp=tk.accept_task,id=5012,text=501224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]