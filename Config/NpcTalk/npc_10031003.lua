--单个npc对话:npc_10031003.lua
local npc_id=10031003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100311,},
  [2]={tp=tk.accept_check,id={2025,2026},},
  [3]={tp=tk.complete_check,id={2024,2025},},
  [4]={tp=tk.close,text=1,},
 },
--task 3801 accept_talk
	[2]=
	{
	 [1]={tp=tk.text,text=380121,},
	 [2]={tp=tk.accept_task,id=3801,text=380122,},
	},
--task 3801 complete_talk
	[3]=
	{
	 [1]={tp=tk.text,text=380121,},
	 [2]={tp=tk.complete_task,id=3801,text=380122,},
	},
--task 3802 accept_talk
 [4]=
 {
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.accept_task,id=3802,text=380122,},
 },
--task 3802 complete_talk
	[5]=
	{
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.complete_task,id=3802,text=380122,},	 
	},
--task 3803 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.accept_task,id=3803,text=380122,}, 
 },
--task 3803 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.complete_task,id=3803,text=380122,},
 },
--task 3804 accept_talk
	[8]=
	{
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.accept_task,id=3804,text=380122,},
	},
--task 3804 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.complete_task,id=3804,text=380122,},
 },
--task 3805 accept_talk
	[10]=
	{
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.accept_task,id=3805,text=380122,},
	},
--task 3805 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=380121,},
  [2]={tp=tk.complete_task,id=3805,text=380122,},
 }, 
--task 2024 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=202431,},
  [2]={tp=tk.page,id=13,text=202432,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=202433,},
  [2]={tp=tk.complete_task,id=2024,text=202434,},
 },
--task 2025 accept_talk
 [15]=
 {
  [1]={tp=tk.text,text=202521,},
  [2]={tp=tk.accept_task,id=2025,text=202522,},
 },
--task 2025 complete_talk 
 [17]=
 {
  [1]={tp=tk.text,text=202531,},
  [2]={tp=tk.complete_task,id=2025,text=202532,},
 },
--task 2026 accept_talk
 [18]=
 {
  [1]={tp=tk.text,text=202621,},
  [2]={tp=tk.page,id=19,text=202622,},
 },
 [19]=
 {
  [1]={tp=tk.text,text=202623,},
  [2]={tp=tk.page,id=20,text=202624,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=202625,},
  [2]={tp=tk.accept_task,id=2026,text=202626,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]