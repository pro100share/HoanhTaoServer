--单个npc对话:npc_10111014.lua
local npc_id=10111014
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101411,},
  [2]={tp=tk.accept_check,id={10043},},
  [3]={tp=tk.complete_check,id={10042},},
  [8]={tp=tk.close,text=1,},
 },
--task 10042 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1004231,},
  [2]={tp=tk.complete_task,id=10042,text=1004232,},
 },
--task 10043 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1004321,},
  [2]={tp=tk.page,id=4,text=1004322,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1004323,},
  [2]={tp=tk.accept_task,id=10043,text=1004324,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]