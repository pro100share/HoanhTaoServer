--单个npc对话:npc_10061001.lua
local npc_id=10061001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100111,},
  [2]={tp=tk.accept_check,id={5050,5051},},
  [3]={tp=tk.complete_check,id={5049,5050},},
  [8]={tp=tk.close,text=1,},
 },
--task 5049 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=504931,},
  [2]={tp=tk.complete_task,id=5049,text=504932,},
 },
--task 5050 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=505021,},
  [2]={tp=tk.page,id=4,text=505022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=505023,},
  [2]={tp=tk.accept_task,id=5050,text=505024,},
 },
--task 5050 complete_talk
 [5]=
 {
		[1]={tp=tk.text,text=505031,},
		[2]={tp=tk.complete_task,id=5050,text=505032,},
 },
--task 5051 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=505121,},
  [2]={tp=tk.page,id=7,text=505122,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=505123,},
  [2]={tp=tk.page,id=8,text=505124,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=505125,},
  [2]={tp=tk.accept_task,id=5051,text=505126,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]