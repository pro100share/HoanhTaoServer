--单个npc对话:npc_10101009.lua
local npc_id=10101009
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1010100911,},
  [2]={tp=tk.accept_check,id={9021,9022},},
  [3]={tp=tk.complete_check,id={9020,9021},},
  [8]={tp=tk.close,text=1,},
 },
--task 9020 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=902031,},
  [2]={tp=tk.complete_task,id=9020,text=902032,},
 },
--task 9021 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=902121,},
  [2]={tp=tk.page,id=4,text=902122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=902123,},
  [2]={tp=tk.page,id=5,text=902124,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=902125,},
  [2]={tp=tk.accept_task,id=9021,text=902126,},
 },
--task 9021 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=902131,},
  [2]={tp=tk.complete_task,id=9021,text=902132,},
 },
--task 9022 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=902221,},
  [2]={tp=tk.page,id=8,text=902222,},  
 },
 [8]=
 {
  [1]={tp=tk.text,text=902223,},
  [2]={tp=tk.accept_task,id=9022,text=902224,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]