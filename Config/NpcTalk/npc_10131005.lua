--单个npc对话:npc_10131005.lua
local npc_id=10131005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100511,},
  [2]={tp=tk.accept_check,id={12022},},
  [3]={tp=tk.complete_check,id={12021},},
  [4]={tp=tk.close,text=1,},
 },
--task 12021 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1202131,},
  [2]={tp=tk.complete_task,id=12021,text=1202132,},
 },
--task 12022 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1202221,},
  [2]={tp=tk.accept_task,id=12022,text=1202222,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]