--单个npc对话:npc_10021012.lua
local npc_id=10021012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002101211,},
  [2]={tp=tk.accept_check,id={2003},},
  [3]={tp=tk.complete_check,id={2002},},
  [4]={tp=tk.shop,id=10000,text=7,},
  [8]={tp=tk.close,text=1,},
 },
--task 2002 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=200231,},
  [2]={tp=tk.complete_task,id=2002,text=200232,},
 },
--task 2003 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200321,},
  [2]={tp=tk.page,id=4,text=200322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=200323,},
  [2]={tp=tk.accept_task,id=2003,text=200324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]