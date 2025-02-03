--单个npc对话:npc_10031022.lua
local npc_id=10031022
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1003102211,},
  [2]={tp=tk.accept_check,id={2032,2033},},
  [3]={tp=tk.complete_check,id={2031,2032,2033,2034},},
  [4]={tp=tk.close,text=1,},
 },
--task 2031 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=203131,},
  [2]={tp=tk.complete_task,id=2031,text=203132,},
 },
--task 2032 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=203221,},
  [2]={tp=tk.accept_task,id=2032,text=203222,},
 },
--task 2032 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=203231,},
  [2]={tp=tk.complete_task,id=2032,text=203232,},
	}, 
--task 2033 accept_talk
 [5]=
 {
  [1]={tp=tk.text,text=203321,},
  [2]={tp=tk.page,id=6,text=203322,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=203323,},
  [2]={tp=tk.accept_task,id=2033,text=203324,},
 },
--task 2033 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=203331,},
  [2]={tp=tk.complete_task,id=2033,text=203332,},
 },
--task 2034 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=203431,},
  [2]={tp=tk.complete_task,id=2034,text=203432,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]