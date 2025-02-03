--单个npc对话:npc_10041016.lua
local npc_id=10041016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004101611,},
  [2]={tp=tk.accept_check,id={3021},},
  [3]={tp=tk.complete_check,id={3020},},
  [8]={tp=tk.close,text=1,},
 },
--task 3020 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=302031,},
  [2]={tp=tk.complete_task,id=3020,text=302032,},
 },
--task 3021 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=302121,},
  [2]={tp=tk.page,id=4,text=302122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=302123,},
  [2]={tp=tk.page,id=5,text=302124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=302125,},
  [2]={tp=tk.accept_task,id=3021,text=302126,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]