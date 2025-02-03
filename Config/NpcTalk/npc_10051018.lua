--单个npc对话:npc_10051018.lua
local npc_id=10051018
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1005101811,},
  [2]={tp=tk.accept_check,id={4040},},
  [3]={tp=tk.complete_check,id={4039},},
  [8]={tp=tk.close,text=1,},
 },
--task 4039 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=403931,},
  [2]={tp=tk.complete_task,id=4039,text=403932,},
 },
--task 4040 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=404021,},
  [2]={tp=tk.page,id=7,text=404022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=404023,},
  [2]={tp=tk.accept_task,id=4040,text=404024,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]