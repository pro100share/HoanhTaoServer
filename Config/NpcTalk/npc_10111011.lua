--单个npc对话:npc_10111011.lua
local npc_id=10111011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101111,},
  [2]={tp=tk.accept_check,id={10027},},
  [3]={tp=tk.complete_check,id={10026},},
  [8]={tp=tk.close,text=1,},
 },
--task 10026 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1002631,},
  [2]={tp=tk.complete_task,id=10026,text=1002632,},
 },
--task 10027 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1002721,},
  [2]={tp=tk.page,id=4,text=1002722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1002723,},
  [2]={tp=tk.accept_task,id=10027,text=1002724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]