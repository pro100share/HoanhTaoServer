--单个npc对话:npc_10021021.lua
local npc_id=10021021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002102111,},
  [2]={tp=tk.accept_check,id={6056,6059},},
  [3]={tp=tk.complete_check,id={6055,6058},},
  [4]={tp=tk.close,text=1,},
 },
--task 6055 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=605531,},
  [2]={tp=tk.complete_task,id=6055,text=605532,},
 },
--task 6056 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=605621,},
  [2]={tp=tk.page,id=4,text=605622,},
 },
 [4]=
 {
	 [1]={tp=tk.text,text=605623,},
	 [2]={tp=tk.accept_task,id=6056,text=605624,},
 },
--task 6058 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=605831,},
  [2]={tp=tk.complete_task,id=6058,text=605832,},
 },
--task 6059 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=605921,},
  [2]={tp=tk.page,id=7,text=605922,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=605923,},
  [2]={tp=tk.page,id=8,text=605924,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=605925,},
  [2]={tp=tk.accept_task,id=6059,text=605926,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  