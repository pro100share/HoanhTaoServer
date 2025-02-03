--单个npc对话:npc_10041018.lua
local npc_id=10041018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101311,},
  [2]={tp=tk.accept_check,id={3022,3023},},
  [3]={tp=tk.complete_check,id={3021,3022},},
  [8]={tp=tk.close,text=1,},
 },
--task 3021 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=302131,},
  [2]={tp=tk.complete_task,id=3021,text=302132,},
 },
--task 3022 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=302221,},
  [2]={tp=tk.page,id=4,text=302222,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=302223,},
  [2]={tp=tk.accept_task,id=3022,text=302224,},
 },
--task 3022 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=302231,},
  [2]={tp=tk.complete_task,id=3022,text=302232,},
 },
--task 3023 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=302321,},
  [2]={tp=tk.page,id=7,text=302322,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=302323,},
  [2]={tp=tk.accept_task,id=3023,text=302324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]