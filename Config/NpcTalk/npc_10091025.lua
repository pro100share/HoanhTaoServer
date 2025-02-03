--单个npc对话:npc_10091025.lua
local npc_id=10091025
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1009102511,},
  [2]={tp=tk.accept_check,id={7203},},
  [3]={tp=tk.complete_check,id={7203},},
  [4]={tp=tk.close,text=1,},
 },
--task 7203 accept_talk
 [2]=
 {
  [1]={tp=tk.text,text=720321,},
  [2]={tp=tk.accept_task,id=7203,text=720322,},
 },
--task 7203 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=720331,},
  [2]={tp=tk.complete_task,id=7203,text=720332,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]  