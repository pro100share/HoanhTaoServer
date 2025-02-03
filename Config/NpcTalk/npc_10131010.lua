--单个npc对话:npc_10131010.lua
local npc_id=10131010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013101011,},
  [2]={tp=tk.accept_check,id={12073},},
  [3]={tp=tk.complete_check,id={12072},},
  [4]={tp=tk.close,text=1,},
 },
--task 12072 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1207231,},
  [2]={tp=tk.complete_task,id=12072,text=1207232,},
 },
--task 12073 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1207321,},
  [2]={tp=tk.page,id=4,text=1207322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1207323,},
  [2]={tp=tk.accept_task,id=12073,text=1207324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]