--单个npc对话:npc_10121033.lua
local npc_id=10121033
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012103311,},
  [2]={tp=tk.accept_check,id={11076},},
  [3]={tp=tk.complete_check,id={11075},},
  [4]={tp=tk.close,text=1,},
 },
--task 11075 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1107531,},
  [2]={tp=tk.complete_task,id=11075,text=1107532,},
 },
--task 11076 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1107621,},
  [2]={tp=tk.page,id=4,text=1107622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1107623,},
  [2]={tp=tk.accept_task,id=11076,text=1107624,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]