--单个npc对话:npc_10031001.lua
local npc_id=10031001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200811,},
  [2]={tp=tk.accept_check,id={2116,2126},},
  [3]={tp=tk.complete_check,id={},},
  [8]={tp=tk.close,text=1,},
 },
--task 2116 accept_talk
 [21]=
 {
  [1]={tp=tk.text,text=211621,},
  [2]={tp=tk.page,id=22,text=211622,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=211623,},
  [2]={tp=tk.page,id=23,text=211624,},
 },
 [23]=
 {
  [1]={tp=tk.text,text=211625,},
  [2]={tp=tk.accept_task,id=2116,text=211626,},
 },
--task 2126 accept_talk
 [24]=
 {
  [1]={tp=tk.text,text=212621,},
  [2]={tp=tk.page,id=25,text=212622,},
 },
 [25]=
 {
  [1]={tp=tk.text,text=212623,},
  [2]={tp=tk.page,id=26,text=212624,},
 },
 [26]=
 {
  [1]={tp=tk.text,text=212625,},
  [2]={tp=tk.accept_task,id=2126,text=212626,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]