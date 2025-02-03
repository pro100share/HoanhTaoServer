--单个npc对话:npc_10011012.lua
local npc_id=10011012
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001101211,},
  [2]={tp=tk.accept_check,id={1014,1015},},
  [3]={tp=tk.complete_check,id={1013,1014},},
  [8]={tp=tk.close,text=1,},
 },
--task 1013 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=101331,},
  [2]={tp=tk.complete_task,id=1013,text=101332,},
 },
--task 1014 accept_talk
 [3]=
 {
	 [1]={tp=tk.text,text=101421,},
	 [2]={tp=tk.page,id=4,text=101422,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101423,},
  [2]={tp=tk.page,id=5,text=101424,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=101425,},
  [2]={tp=tk.accept_task,id=1014,text=101426,},
 },
--task 1014 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=101431,},
  [2]={tp=tk.complete_task,id=1014,text=101432,},
 },
--task 1015 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=101521,},
  [2]={tp=tk.accept_task,id=1015,text=101522,},
 },

}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]