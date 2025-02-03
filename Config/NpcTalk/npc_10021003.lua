--单个npc对话:npc_10021003.lua
local npc_id=10021003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200311,},
  [2]={tp=tk.accept_check,id={2005},},
  [3]={tp=tk.complete_check,id={2004},},
  [4]={tp=tk.shop,id=30000,text=2,},
  [8]={tp=tk.close,text=1,},
 },
--task 2004 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=200431,},
  [2]={tp=tk.complete_task,id=2004,text=200432,},
 },
--task 2005 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200521,},
  [2]={tp=tk.page,id=4,text=200522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=200721,},
  [2]={tp=tk.page,id=5,text=200722,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=200723,},
  [2]={tp=tk.accept_task,id=2005,text=200724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]