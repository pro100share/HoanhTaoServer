--单个npc对话:npc_10051019.lua
local npc_id=10051019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005101911,},
  [2]={tp=tk.accept_check,id={4038},},
  [3]={tp=tk.complete_check,id={4036},},
  [8]={tp=tk.close,text=1,},
 },
--task 4036 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=403631,},
  [2]={tp=tk.complete_task,id=4036,text=403632,},
 },
--task 4038 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=403821,},
  [2]={tp=tk.page,id=4,text=403822,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=403823,},
  [2]={tp=tk.accept_task,id=4038,text=403824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]