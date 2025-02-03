--单个npc对话:npc_10051012.lua
local npc_id=10051012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005101211,},
  [2]={tp=tk.accept_check,id={4031,4032},},
  [3]={tp=tk.complete_check,id={4030,4031},},
  [8]={tp=tk.close,text=1,},
 },
--task 4030 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=403031,},
  [2]={tp=tk.complete_task,id=4030,text=403032,},
 },
--task 4031 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=403121,},
  [2]={tp=tk.page,id=4,text=403122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=403123,},
  [2]={tp=tk.accept_task,id=4031,text=403124,},
 },
--task 4031 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=403131,},
  [2]={tp=tk.complete_task,id=4031,text=403132,},
	},
--task 4032 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=403221,},
  [2]={tp=tk.accept_task,id=4032,text=403222,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]