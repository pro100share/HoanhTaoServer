--单个npc对话:npc_10121010.lua
local npc_id=10121010
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012101011,},
  [2]={tp=tk.accept_check,id={11025},},
  [3]={tp=tk.complete_check,id={11024},},
  [4]={tp=tk.close,text=1,},
 },
--task 11024 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1102431,},
  [2]={tp=tk.complete_task,id=11024,text=1102432,},
 },
--task 11025 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1102521,},
  [2]={tp=tk.page,id=4,text=1102522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1102523,},
  [2]={tp=tk.accept_task,id=11025,text=1102524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]