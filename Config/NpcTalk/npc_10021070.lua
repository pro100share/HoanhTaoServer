--单个npc对话:npc_10021070.lua
local npc_id=10021070
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002107011,},
  [2]={tp=tk.accept_check,id={2301},},
  [3]={tp=tk.complete_check,id={2301},},
  [5]={tp=tk.find_npc,id={2301},},  
  [8]={tp=tk.close,text=1,},
 },
--task 2301 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=230121,},
  [2]={tp=tk.page,id=3,text=230122,},
 }, 
 [3]=
 {
  [1]={tp=tk.text,text=230123,},
  [2]={tp=tk.page,id=4,text=230124,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=230125,},
  [2]={tp=tk.accept_task,id=2301,text=230126,},
 },
--task 2301 给钱
 [5] =
 {
  [1]={tp=tk.text,text=230141,},
  [2]={tp=tk.page,id=6,text=230142,},
  [3]={tp=tk.close,text=230143,},
 },
 [6] = {
		[1]={tp=tk.text,text=230144,},
		[2]={tp=tk.talk_over,id=2301,text=230145,},
 },
--task 2301 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=230131,},
  [2]={tp=tk.complete_task,id=2301,text=230132,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]