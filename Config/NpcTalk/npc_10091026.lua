--单个npc对话:npc_10091026.lua
local npc_id=10091026
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102611,},
  [2]={tp=tk.accept_check,id={7204},},
  [3]={tp=tk.complete_check,id={7204},},
  [4]={tp=tk.close,text=1,},
 },
--task 7204 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=720421,},
  [2]={tp=tk.accept_task,id=7204,text=720422,},
 },
--task 7204 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=720431,},
  [2]={tp=tk.complete_task,id=7204,text=720432,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  