--单个npc对话:npc_10041019.lua
local npc_id=10041019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101611,},
  [2]={tp=tk.accept_check,id={3035},},
  [3]={tp=tk.complete_check,id={3034},},
  [8]={tp=tk.close,text=1,},
 },
--task 3034 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=303431,},
  [2]={tp=tk.complete_task,id=3034,text=303432,},
 },
--task 3035 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=303521,},
  [2]={tp=tk.page,id=4,text=303522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=303523,},
  [2]={tp=tk.page,id=5,text=303524,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=303525,},
  [2]={tp=tk.accept_task,id=3035,text=303526,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]