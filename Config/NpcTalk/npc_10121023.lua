--单个npc对话:npc_10121023.lua
local npc_id=10121023
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012102311,},
  [2]={tp=tk.accept_check,id={11064,11065},},
  [3]={tp=tk.complete_check,id={11063,11064},},
  [4]={tp=tk.close,text=1,},
 },
--task 11063 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1106331,},
  [2]={tp=tk.complete_task,id=11063,text=1106332,},
 },
--task 11064 accept_talk
 [3]=
	{
	 [1]={tp=tk.text,text=1106421,},
	 [2]={tp=tk.page,id=4,text=1106422,},
	}, 
 [4]=
 {
  [1]={tp=tk.text,text=1106423,},
  [2]={tp=tk.accept_task,id=11064,text=1106424,},
 },
--task 11064 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1106431,},
  [2]={tp=tk.complete_task,id=11064,text=1106432,},
 },
--task 11065 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1106521,},
  [2]={tp=tk.page,id=7,text=1106522,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1106523,},
  [2]={tp=tk.accept_task,id=11065,text=1106524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]