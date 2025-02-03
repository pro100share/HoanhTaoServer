--单个npc对话:npc_10011005.lua
local npc_id=10011005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100511,},
  [2]={tp=tk.accept_check,id={1013},},
  [3]={tp=tk.complete_check,id={1012},},
  [8]={tp=tk.close,text=1,},
 },
--task 1012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=101231,},
  [2]={tp=tk.complete_task,id=1012,text=101232,},
 },
--task 1013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=101321,},
  [2]={tp=tk.page,id=4,text=101322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101323,},
  [2]={tp=tk.page,id=5,text=101324,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=101325,},
  [2]={tp=tk.accept_task,id=1013,text=101326,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]