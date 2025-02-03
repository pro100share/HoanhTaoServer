--单个npc对话:npc_10091011.lua
local npc_id=10091011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009101111,},
  [2]={tp=tk.accept_check,id={7046,7059,7060},},
  [3]={tp=tk.complete_check,id={7045,7058,7059},},
  [4]={tp=tk.close,text=1,},
 },
--task 7045 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=704531,},
  [2]={tp=tk.complete_task,id=7045,text=704532,},
 },
--task 7046 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=704621,},
  [2]={tp=tk.page,id=4,text=704622,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=704623,},
  [2]={tp=tk.accept_task,id=7046,text=704624,},
 },
--task 7058 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=705831,},
  [2]={tp=tk.complete_task,id=7058,text=705832,},
 },
--task 7059 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=705921,},
  [2]={tp=tk.page,id=7,text=705922,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=705923,},
  [2]={tp=tk.accept_task,id=7059,text=705924,},
 },
--task 7059 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=705931,},
  [2]={tp=tk.complete_task,id=7059,text=705932,},
 },
--task 7060 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=706021,},
  [2]={tp=tk.accept_task,id=7060,text=706022,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]