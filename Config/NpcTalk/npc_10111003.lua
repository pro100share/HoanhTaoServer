--单个npc对话:npc_10111003.lua
local npc_id=10111003
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011100311,},
  [2]={tp=tk.accept_check,id={10004},},
  [3]={tp=tk.complete_check,id={10003},},
  [8]={tp=tk.close,text=1,},
 },
--task 10003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1000331,},
  [2]={tp=tk.complete_task,id=10003,text=1000332,},
 },
--task 10004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1000421,},
  [2]={tp=tk.page,id=4,text=1000422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1000423,},
  [2]={tp=tk.accept_task,id=10004,text=1000424,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]