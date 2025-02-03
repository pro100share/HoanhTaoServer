--单个npc对话:npc_10041001.lua
local npc_id=10041001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004100111,},
  [2]={tp=tk.accept_check,id={3001,3037},},
  [3]={tp=tk.complete_check,id={2044,3041},},
  [8]={tp=tk.close,text=1,},
 },
--task 2044 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=204431,},
  [2]={tp=tk.complete_task,id=2044,text=204432,},
 },
--task 3001 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=300121,},
  [2]={tp=tk.page,id=4,text=300122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=300123,},
  [2]={tp=tk.accept_task,id=3001,text=300124,},
 },
--task 3041 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=304131,},
  [2]={tp=tk.complete_task,id=3041,text=304132,},
 },
--task 3037 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=303721,},
  [2]={tp=tk.page,id=7,text=303722,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=303723,},
  [2]={tp=tk.accept_task,id=3037,text=303724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]