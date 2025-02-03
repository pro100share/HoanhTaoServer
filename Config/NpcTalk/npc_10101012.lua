--单个npc对话:npc_10101012.lua
local npc_id=10101012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010101211,},
  [2]={tp=tk.accept_check,id={9041,9042,9050,9051},},
  [3]={tp=tk.complete_check,id={9040,9041,9049,9050},},
  [8]={tp=tk.close,text=1,},
 },
--task 9040 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=904031,},
  [2]={tp=tk.complete_task,id=9040,text=904032,},
 },
--task 9041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=904121,},
  [2]={tp=tk.page,id=4,text=904122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=904123,},
  [2]={tp=tk.accept_task,id=9041,text=904124,},
 },
--task 9041 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=904131,},
  [2]={tp=tk.complete_task,id=9041,text=904132,},
 },
--task 9042 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=904221,},
  [2]={tp=tk.page,id=7,text=904222,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=904223,},
  [2]={tp=tk.accept_task,id=9042,text=904224,},
 },
--task 9049 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=904931,},
  [2]={tp=tk.complete_task,id=9049,text=904932,},
 },
--task 9050 accept_talk
 [9]=
 {
  [1]={tp=tk.text,text=905021,},
  [2]={tp=tk.page,id=10,text=905022,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=905023,},
  [2]={tp=tk.accept_task,id=9050,text=905024,},
 },
--task 9050 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=905031,},
  [2]={tp=tk.complete_task,id=9050,text=905032,},
 },
--task 9051 accept_talk
 [12]=
 {
  [1]={tp=tk.text,text=905121,},
  [2]={tp=tk.page,id=13,text=905122,},
 },
 [13]=
 {
  [1]={tp=tk.text,text=905123,},
  [2]={tp=tk.accept_task,id=9051,text=905124,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]