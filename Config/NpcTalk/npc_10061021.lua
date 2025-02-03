--单个npc对话:npc_10061021.lua
local npc_id=10061021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006102111,},
  [2]={tp=tk.accept_check,id={5042,5044},},
  [3]={tp=tk.complete_check,id={5041,5043},},
  [8]={tp=tk.close,text=1,},
 },
--task 5041 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=504131,},
  [2]={tp=tk.complete_task,id=5041,text=504132,},
 },
--task 5042 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=504221,},
  [2]={tp=tk.page,id=4,text=504222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=504223,},
  [2]={tp=tk.accept_task,id=5042,text=504224,},
 },
--task 5043 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=504331,},
  [2]={tp=tk.complete_task,id=5043,text=504332,},
 },
--task 5044 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=504421,},
  [2]={tp=tk.page,id=7,text=504422,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=504423,},
  [2]={tp=tk.page,id=8,text=504424,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=504425,},
  [2]={tp=tk.accept_task,id=5044,text=504426,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]