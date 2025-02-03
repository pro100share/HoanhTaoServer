--单个npc对话:npc_10131006.lua
local npc_id=10131006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100611,},
  [2]={tp=tk.accept_check,id={12030},},
  [3]={tp=tk.complete_check,id={12029},},
  [4]={tp=tk.close,text=1,},
 },
--task 12029 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1202931,},
  [2]={tp=tk.complete_task,id=12029,text=1202932,},
 },
--task 12030 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1203021,},
  [2]={tp=tk.page,id=4,text=1203022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1203023,},
  [2]={tp=tk.page,id=5,text=1203024,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1203025,},
  [2]={tp=tk.accept_task,id=12030,text=1203026,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]