--单个npc对话:npc_10131011.lua
local npc_id=10131011
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013101111,},
  [2]={tp=tk.accept_check,id={12074,12075,12078},},
  [3]={tp=tk.complete_check,id={12073,12074,12077},},
  [4]={tp=tk.close,text=1,},
 },
--task 12073 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1207331,},
  [2]={tp=tk.complete_task,id=12073,text=1207332,},
 },
--task 12074 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1207421,},
  [2]={tp=tk.page,id=4,text=1207422,},
 },
	[4]=
	{
	 [1]={tp=tk.text,text=1207423,},
	 [2]={tp=tk.page,id=5,text=1207424,},
	},
	[5]=
	{
	 [1]={tp=tk.text,text=1207425,},
	 [2]={tp=tk.accept_task,id=12074,text=1207426,},
	},
--task 12074 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1207431,},
  [2]={tp=tk.complete_task,id=12074,text=1207432,},
 },
--task 12075 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1207521,},
  [2]={tp=tk.page,id=8,text=1207522,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1207523,},
  [2]={tp=tk.accept_task,id=12075,text=1207524,},
 },
--task 12077 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=1207731,},
  [2]={tp=tk.complete_task,id=12077,text=1207732,},
 },
--task 12078 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=1207821,},
  [2]={tp=tk.page,id=11,text=1207822,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=1207823,},
  [2]={tp=tk.accept_task,id=12078,text=1207824,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]