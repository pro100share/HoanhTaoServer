--单个npc对话:npc_10071016.lua
local npc_id=10071016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007101611,},
  [2]={tp=tk.accept_check,id={6020},},
  [3]={tp=tk.complete_check,id={6019},},
  [4]={tp=tk.close,text=1,},
 },
--task 6019 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=601931,},
  [2]={tp=tk.complete_task,id=6019,text=601932,},
 },
--task 6020 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=602021,},
  [2]={tp=tk.page,id=4,text=602022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=602023,},
  [2]={tp=tk.accept_task,id=6020,text=602024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  