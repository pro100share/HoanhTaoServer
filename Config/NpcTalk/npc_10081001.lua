--单个npc对话:npc_10081001.lua
local npc_id=10081001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1008100111,},
  [2]={tp=tk.accept_check,id={8001,8002,8003},},
  [3]={tp=tk.complete_check,id={7060,8001,8002},},
  [4]={tp=tk.close,text=1,},
 },
--task 7060 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=706031,},
  [2]={tp=tk.complete_task,id=7060,text=706032,},
 },
--task 8001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=800121,},
  [2]={tp=tk.page,id=4,text=800122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=800123,},
  [2]={tp=tk.page,id=5,text=800124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=800125,},
  [2]={tp=tk.accept_task,id=8001,text=800126,},
 },
--task 8001 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=800131,},
  [2]={tp=tk.complete_task,id=8001,text=800132,},
 },
--task 8002 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=800221,},
  [2]={tp=tk.page,id=8,text=800222,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=800223,},
  [2]={tp=tk.accept_task,id=8002,text=800224,},
 },
--task 8002 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=800231,},
  [2]={tp=tk.complete_task,id=8002,text=800232,},
 },
--task 8003 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=800321,},
  [2]={tp=tk.page,id=11,text=800322,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=800323,},
  [2]={tp=tk.accept_task,id=8003,text=800324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]