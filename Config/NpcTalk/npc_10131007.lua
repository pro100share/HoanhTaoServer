--单个npc对话:npc_10131007.lua
local npc_id=10131007
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100711,},
  [2]={tp=tk.accept_check,id={12041,12042},},
  [3]={tp=tk.complete_check,id={12040,12041},},
  [4]={tp=tk.close,text=1,},
 },
--task 12040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1204031,},
  [2]={tp=tk.complete_task,id=12040,text=1204032,},
 },
--task 12041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1204121,},
  [2]={tp=tk.page,id=4,text=1204122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1204123,},
  [2]={tp=tk.accept_task,id=12041,text=1204124,},
 },
--task 12041 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1204131,},
  [2]={tp=tk.complete_task,id=12041,text=1204132,},
 },
--task 12042 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1204221,},
  [2]={tp=tk.page,id=7,text=1204222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1204223,},
  [2]={tp=tk.accept_task,id=12042,text=1204224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]