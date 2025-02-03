--单个npc对话:npc_10011014.lua
local npc_id=10011014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001101411,},
  [2]={tp=tk.accept_check,id={1022},},
  [3]={tp=tk.complete_check,id={1021},},
  [8]={tp=tk.close,text=1,},
 },
--task 1021 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=102131,},
  [2]={tp=tk.complete_task,id=1021,text=102132,},
 },
--task 1022 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=102221,},
  [2]={tp=tk.page,id=4,text=102222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=102223,},
  [2]={tp=tk.page,id=5,text=102224,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=102225,},
  [2]={tp=tk.accept_task,id=1022,text=102226,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]