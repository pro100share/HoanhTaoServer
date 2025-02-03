--单个npc对话:npc_10021019.lua
local npc_id=10021019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101911,},
  [2]={tp=tk.accept_check,id={2001},},
  [3]={tp=tk.complete_check,id={1023},},
  [8]={tp=tk.close,text=1,},
 },
--task 1023 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=102331,},
  [2]={tp=tk.complete_task,id=1023,text=102332,},
 },
--task 2001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200121,},
  [2]={tp=tk.accept_task,id=2001,text=200122,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]