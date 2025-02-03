--单个npc对话:npc_10041021.lua
local npc_id=10041021
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1004102111,},
  [2]={tp=tk.accept_check,id={3041},},
  [3]={tp=tk.complete_check,id={3036},},
  [8]={tp=tk.close,text=1,},
 },
--task 3036 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=303631,},
  [2]={tp=tk.complete_task,id=3036,text=303632,},
 },
--task 3041 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=304121,},
  [2]={tp=tk.page,id=4,text=304122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=304123,},
  [2]={tp=tk.page,id=5,text=304124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=304125,},
  [2]={tp=tk.accept_task,id=3041,text=304126,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]