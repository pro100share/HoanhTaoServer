--单个npc对话:npc_10071021.lua
local npc_id=10071021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007102111,},
  [2]={tp=tk.accept_check,id={6043,6055},},
  [3]={tp=tk.complete_check,id={6042,6054},},
  [4]={tp=tk.close,text=1,},
 },
--task 6042 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=604231,},
  [2]={tp=tk.complete_task,id=6042,text=604232,},
 },
--task 6043 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=604321,},
  [2]={tp=tk.page,id=4,text=604322,},
 },
 [4]=
 {
	 [1]={tp=tk.text,text=604323,},
	 [2]={tp=tk.accept_task,id=6043,text=604324,},
 },
--task 6054 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=605431,},
  [2]={tp=tk.complete_task,id=6054,text=605432,},
 },
--task 6055 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=605521,},
  [2]={tp=tk.page,id=7,text=605522,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=605523,},
  [2]={tp=tk.accept_task,id=6055,text=605524,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  