--单个npc对话:npc_10051003.lua
local npc_id=10051003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005100311,},
  [2]={tp=tk.accept_check,id={4012,4013,4014},},
  [3]={tp=tk.complete_check,id={4011,4012,4013},},
  [8]={tp=tk.close,text=1,},
 },
--task 4011 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=401131,},
  [2]={tp=tk.complete_task,id=4011,text=401132,},
 },
--task 4012 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=401221,},
  [2]={tp=tk.accept_task,id=4012,text=401222,},
 },
--task 4012 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=401231,},
  [2]={tp=tk.complete_task,id=4012,text=401232,},
 },
--task 4013 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=401321,},
  [2]={tp=tk.page,id=13,text=401322,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=401323,},
  [2]={tp=tk.accept_task,id=4013,text=401324,},
 },
--task 4013 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=401331,},
  [2]={tp=tk.complete_task,id=4013,text=401332,},
 },
--task 4014 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=401421,},
  [2]={tp=tk.page,id=9,text=401422,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=401423,},
  [2]={tp=tk.accept_task,id=4014,text=401424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]