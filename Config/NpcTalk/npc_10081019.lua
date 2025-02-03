--单个npc对话:npc_10081019.lua
local npc_id=10081019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008101911,},
  [2]={tp=tk.accept_check,id={8203,8204},},
  [3]={tp=tk.complete_check,id={8203,8204},},
  [8]={tp=tk.close,text=1,},
 },
--task 8203 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=820321,},
  [2]={tp=tk.accept_task,id=8203,text=820322,},
 },
--task 8203 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=820331,},
  [2]={tp=tk.complete_task,id=8203,text=820332,},
 },
--task 8204 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=820421,},
  [2]={tp=tk.accept_task,id=8204,text=820422,},
 },
--task 8204 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=820431,},
  [2]={tp=tk.complete_task,id=8204,text=820432,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]