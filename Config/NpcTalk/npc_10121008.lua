--单个npc对话:npc_10121008.lua
local npc_id=10121008
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1012100811,},
  [2]={tp=tk.accept_check,id={11021,11022,11023,11031},},
  [3]={tp=tk.complete_check,id={11020,11021,11022,11026,11030},},
  [4]={tp=tk.close,text=1,},
 },
--task 11020 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1102031,},
  [2]={tp=tk.complete_task,id=11020,text=1102032,},
 },
--task 11021 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1102121,},
  [2]={tp=tk.page,id=4,text=1102122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1102123,},
  [2]={tp=tk.accept_task,id=11021,text=1102124,},
 },
--task 11021 complete_talk
 [5]=
	{
	 [1]={tp=tk.text,text=1102131,},
	 [2]={tp=tk.complete_task,id=11021,text=1102132,},
	},
--task 11022 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=1102221,},
  [2]={tp=tk.page,id=7,text=1102222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=1102223,},
  [2]={tp=tk.accept_task,id=11022,text=1102224,},
 },
--task 11022 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=1102231,},
  [2]={tp=tk.complete_task,id=11022,text=1102232,},
 },
--task 11023 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=1102321,},
  [2]={tp=tk.page,id=10,text=1102322,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=1102323,},
  [2]={tp=tk.accept_task,id=11023,text=1102324,},
 },
--task 11026 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1102631,},
  [2]={tp=tk.complete_task,id=11026,text=1102632,},
 },
--task 11030 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=1103031,},
  [2]={tp=tk.complete_task,id=11030,text=1103032,},
 },
--task 11031 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=1103121,},
  [2]={tp=tk.accept_task,id=11031,text=1103122,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]