--单个npc对话:npc_10061002.lua
local npc_id=10061002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100211,},
  [2]={tp=tk.accept_check,id={5024,5025,5026,5028,5101},},
  [3]={tp=tk.complete_check,id={5023,5024,5025,5027,5103},},
  [8]={tp=tk.close,text=1,},
 },
--task 5023 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=502331,},
  [2]={tp=tk.complete_task,id=5023,text=502332,},
 },
--task 5024 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=502421,},
  [2]={tp=tk.page,id=4,text=502422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=502423,},
  [2]={tp=tk.accept_task,id=5024,text=502424,},
 },
--task 5024 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=502431,},
  [2]={tp=tk.complete_task,id=5024,text=502432,},
 },
--task 5025 accept_talk
 [6]=
 {
	 [1]={tp=tk.text,text=502521,},
	 [2]={tp=tk.page,id=7,text=502522,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=502523,},
  [2]={tp=tk.accept_task,id=5025,text=502524,},
 },
--task 5025 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=502531,},
  [2]={tp=tk.complete_task,id=5025,text=502532,},
 },
--task 5026 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=502621,},
  [2]={tp=tk.page,id=10,text=502622,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=502623,},
  [2]={tp=tk.accept_task,id=5026,text=502624,},
 },
--task 5027 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=502731,},
  [2]={tp=tk.complete_task,id=5027,text=502732,},
 },
--task 5028 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=502821,},
  [2]={tp=tk.page,id=13,text=502822,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=502823,},
  [2]={tp=tk.accept_task,id=5028,text=502824,},
 },
--task 5101 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=510121,},
  [2]={tp=tk.page,id=15,text=510122,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=510123,},
  [2]={tp=tk.page,id=16,text=510124,},
 },
 [16]=
 {
  [1]={tp=tk.text,text=510125,},
  [2]={tp=tk.accept_task,id=5101,text=510126,},
 },
--task 5103 complete_talk
 [17]=
 {
  [1]={tp=tk.text,text=510331,},
  [2]={tp=tk.complete_task,id=5103,text=510332,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]