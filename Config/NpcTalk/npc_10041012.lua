--单个npc对话:npc_10041012.lua
local npc_id=10041012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101211,},
  [2]={tp=tk.accept_check,id={3025,3031},},
  [3]={tp=tk.complete_check,id={3024,3030},},
  [8]={tp=tk.close,text=1,},
 },
--task 3024 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=302431,},
  [2]={tp=tk.complete_task,id=3024,text=302432,},
 },
--task 3025 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=302521,},
  [2]={tp=tk.page,id=4,text=302522,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=302523,},
  [2]={tp=tk.page,id=5,text=302524,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=302525,},
  [2]={tp=tk.accept_task,id=3025,text=302526,},
 },
--task 3030 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=303031,},
  [2]={tp=tk.complete_task,id=3030,text=303032,},
 },
--task 3031 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=303121,},
  [2]={tp=tk.page,id=8,text=303122,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=303123,},
  [2]={tp=tk.accept_task,id=3031,text=303124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]   