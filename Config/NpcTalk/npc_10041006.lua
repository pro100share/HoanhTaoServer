--单个npc对话:npc_10041006.lua
local npc_id=10041006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100611,},
  [2]={tp=tk.accept_check,id={3013,3014,3015},},
  [3]={tp=tk.complete_check,id={3012,3013,3014},},
  [8]={tp=tk.close,text=1,},
 },
--task 3012 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=301231,},
  [2]={tp=tk.complete_task,id=3012,text=301232,},
 },
--task 3013 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=301321,},
  [2]={tp=tk.page,id=4,text=301322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=301323,},
  [2]={tp=tk.accept_task,id=3013,text=301324,},
 },
--task 3013 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=301331,},
  [2]={tp=tk.complete_task,id=3013,text=301332,},
 },
--task 3014 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=301421,},
  [2]={tp=tk.accept_task,id=3014,text=301422,},
 },
--task 3014 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=301431,},
  [2]={tp=tk.complete_task,id=3014,text=301432,},
 },
--task 3015 accept_talk
 [8]=
 {
  [1]={tp=tk.text,text=301521,},
  [2]={tp=tk.accept_task,id=3015,text=301522,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]