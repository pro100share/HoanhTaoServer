--单个npc对话:npc_10031002.lua
local npc_id=10031002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003100211,},
  [2]={tp=tk.accept_check,id={2030,2031},},
  [3]={tp=tk.complete_check,id={2041,2030},},
  [8]={tp=tk.close,text=1,},
 },
--task 2041 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=204131,},
  [2]={tp=tk.complete_task,id=2041,text=204132,},
 },
--task 2030 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=203021,},
  [2]={tp=tk.page,id=4,text=203022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=203023,},
  [2]={tp=tk.page,id=5,text=203024,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=203025,},
  [2]={tp=tk.accept_task,id=2030,text=203026,},
 },
--task 2030 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=203031,},
  [2]={tp=tk.complete_task,id=2030,text=203032,},
 },
--task 2031 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=203121,},
  [2]={tp=tk.page,id=8,text=203122,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=203123,},
  [2]={tp=tk.accept_task,id=2031,text=203124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]