--单个npc对话:npc_10071013.lua
local npc_id=10071013
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101311,},
  [2]={tp=tk.accept_check,id={6038,6042},},
  [3]={tp=tk.complete_check,id={6037,6041},},
  [4]={tp=tk.close,text=1,},
 },
--task 6037 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=603731,},
  [2]={tp=tk.complete_task,id=6037,text=603732,},
 },
--task 6038 accept_talk
 [3]=
	{
	 [1]={tp=tk.text,text=603821,},
	 [2]={tp=tk.page,id=4,text=603822,},
	},
	[4]=
	{
	 [1]={tp=tk.text,text=603823,},
	 [2]={tp=tk.page,id=5,text=603824,},
	},
	[5]=
	{
	 [1]={tp=tk.text,text=603825,},
	 [2]={tp=tk.accept_task,id=6038,text=603826,},
	},
--task 6041 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=604131,},
  [2]={tp=tk.complete_task,id=6041,text=604132,},
 },
--task 6042 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=604221,},
  [2]={tp=tk.accept_task,id=6042,text=604222,},
 },
 -- [8]=
 -- {
  -- [1]={tp=tk.text,text=604223,},
  -- [2]={tp=tk.accept_task,id=6042,text=604224,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  