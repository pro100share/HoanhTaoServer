--单个npc对话:npc_10111019.lua
local npc_id=10111019
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100611,},
  [2]={tp=tk.accept_check,id={10044},},
  [3]={tp=tk.complete_check,id={10043},},
  [8]={tp=tk.close,text=1,},
 },
--task 10043 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=1004331,},
  [2]={tp=tk.complete_task,id=10043,text=1004332,},
 },
--task 10044 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=1004421,},
  [2]={tp=tk.page,id=13,text=1004422,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=1004423,},
  [2]={tp=tk.accept_task,id=10044,text=1004424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]