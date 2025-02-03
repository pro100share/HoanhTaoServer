--单个npc对话:npc_10011006.lua
local npc_id=10011006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100611,},
  [2]={tp=tk.accept_check,id={1010},},
  [3]={tp=tk.complete_check,id={1009},},  
  [8]={tp=tk.close,text=1,},
 },
--task 1009 complete_talk
 [2]=
	{
	 [1]={tp=tk.text,text=100931,},
	 [2]={tp=tk.complete_task,id=1009,text=100932,},
	},
--task 1010 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=101021,},
  [2]={tp=tk.page,id=4,text=101022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101023,},
  [2]={tp=tk.accept_task,id=1010,text=101024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]