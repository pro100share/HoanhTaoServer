--单个npc对话:npc_10031010.lua
local npc_id=10031010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003101011,},
  [2]={tp=tk.accept_check,id={2024},},
  [3]={tp=tk.complete_check,id={2039,2027},},
  [4]={tp=tk.close,text=1,},
 },
--task 2039 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=203931,},
  [2]={tp=tk.complete_task,id=2039,text=203932,},
 },
--task 2024 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=202421,},
  [2]={tp=tk.page,id=4,text=202422,},
 },
 [4]=
 {
	 [1]={tp=tk.text,text=202423,},
	 [2]={tp=tk.accept_task,id=2024,text=202424,},
 },
--task 2027 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=202731,},
  [2]={tp=tk.complete_task,id=2027,text=202732,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 