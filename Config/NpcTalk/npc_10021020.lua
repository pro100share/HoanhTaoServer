--单个npc对话:npc_10021020.lua
local npc_id=10021020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002102011,},
  [2]={tp=tk.accept_check,id={4041},},
  [3]={tp=tk.complete_check,id={4040},},
  [8]={tp=tk.close,text=1,},
 },
--task 4040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=404031,},
  [2]={tp=tk.complete_task,id=4040,text=404032,},
 },
--task 4041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=404121,},
  [2]={tp=tk.page,id=4,text=404122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=404123,},
  [2]={tp=tk.page,id=5,text=404124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=404125,},
  [2]={tp=tk.accept_task,id=4041,text=404126,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]