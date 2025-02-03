--单个npc对话:npc_10061016.lua
local npc_id=10061016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006101611,},
  [2]={tp=tk.accept_check,id={5001,5002},},
  [3]={tp=tk.complete_check,id={4041,5001},},
  [8]={tp=tk.close,text=1,},
 },
--task 4041 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=404131,},
  [2]={tp=tk.complete_task,id=4041,text=404132,},
 },
--task 5001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=500121,},
  [2]={tp=tk.page,id=4,text=500122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=500123,},
  [2]={tp=tk.page,id=5,text=500124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=500125,},
  [2]={tp=tk.accept_task,id=5001,text=500126,},
 },
--task 5001 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=500131,},
  [2]={tp=tk.complete_task,id=5001,text=500132,},
 },
--task 5002 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=500221,},
  [2]={tp=tk.page,id=8,text=500222,},
 },
	[8]=
	{
	 [1]={tp=tk.text,text=500223,},
	 [2]={tp=tk.accept_task,id=5002,text=500224,},
	},
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]