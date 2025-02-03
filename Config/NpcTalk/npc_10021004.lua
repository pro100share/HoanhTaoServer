--单个npc对话:npc_10021004.lua
local npc_id=10021004
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200411,},
  [2]={tp=tk.accept_check,id={2004,4117},},
  [3]={tp=tk.complete_check,id={2040},},
  [4]={tp=tk.shop,id=20000,text=3,},
  [8]={tp=tk.close,text=1,},
 },
--task 2040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=204031,},
  [2]={tp=tk.complete_task,id=2040,text=204032,},
 },
--task 2004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=200421,},
  [2]={tp=tk.page,id=4,text=200422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=200423,},
  [2]={tp=tk.accept_task,id=2004,text=200424,},
 },
--task 4117 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=411721,},
  [2]={tp=tk.accept_task,id=4117,text=411722,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]