--单个npc对话:npc_10061022.lua
local npc_id=10061022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006102211,},
  [2]={tp=tk.accept_check,id={5043},},
  [3]={tp=tk.complete_check,id={5042},},
  [8]={tp=tk.close,text=1,},
 },
--task 5042 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=504231,},
  [2]={tp=tk.complete_task,id=5042,text=504232,},
 },
--task 5043 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=504321,},
  [2]={tp=tk.page,id=4,text=504322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=504323,},
  [2]={tp=tk.accept_task,id=5043,text=504324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]