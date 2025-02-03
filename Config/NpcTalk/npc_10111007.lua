--单个npc对话:npc_10111007.lua
local npc_id=10111007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100711,},
  [2]={tp=tk.accept_check,id={10015},},
  [3]={tp=tk.complete_check,id={10014},},
  [8]={tp=tk.close,text=1,},
 },
--task 10014 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1001431,},
  [2]={tp=tk.complete_task,id=10014,text=1001432,},
 },
--task 10015 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1001521,},
  [2]={tp=tk.page,id=4,text=1001522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1001523,},
  [2]={tp=tk.accept_task,id=10015,text=1001524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]