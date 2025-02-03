--单个npc对话:npc_10071001.lua
local npc_id=10071001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1007100111,},
  [2]={tp=tk.accept_check,id={6047,6052},},
  [3]={tp=tk.complete_check,id={6046,6051},},
  [8]={tp=tk.close,text=1,},
 },
--task 6046 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=604631,},
  [2]={tp=tk.complete_task,id=6046,text=604632,},
 },
--task 6047 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=604721,},
  [2]={tp=tk.page,id=4,text=604722,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=604723,},
  [2]={tp=tk.page,id=5,text=604724,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=604725,},
  [2]={tp=tk.accept_task,id=6047,text=604726,},
 },
--task 6051 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=605131,},
  [2]={tp=tk.complete_task,id=6051,text=605132,},
 },
--task 6052 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=605221,},
  [2]={tp=tk.page,id=8,text=605222,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=605223,},
  [2]={tp=tk.accept_task,id=6052,text=605224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]