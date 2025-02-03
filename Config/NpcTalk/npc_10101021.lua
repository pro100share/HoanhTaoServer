--单个npc对话:npc_10101021.lua
local npc_id=10101021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010102111,},
  [2]={tp=tk.accept_check,id={9204},},
  [3]={tp=tk.complete_check,id={9204},},
  [8]={tp=tk.close,text=1,},
 },
--task 9204 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=920421,},
  [2]={tp=tk.accept_task,id=9204,text=920422,},
 },
--task 9204 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=920431,},
  [2]={tp=tk.complete_task,id=9204,text=920432,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]