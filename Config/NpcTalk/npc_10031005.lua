--单个npc对话:npc_10031005.lua
local npc_id=10031005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100511,},
  [2]={tp=tk.accept_check,id={2011},},
  [3]={tp=tk.complete_check,id={2010},},
  [4]={tp=tk.close,text=1,},
 },
--task 2010 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=201031,},
  [2]={tp=tk.complete_task,id=2010,text=201032,},
 },
--task 2011 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=201121,},
  [2]={tp=tk.page,id=4,text=201122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=201123,},
  [2]={tp=tk.accept_task,id=2011,text=201124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]