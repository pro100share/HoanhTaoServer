--单个npc对话:npc_10061005.lua
local npc_id=10061005
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100511,},
  -- [2]={tp=tk.accept_check,id={5031,5032,5033},},
  -- [3]={tp=tk.complete_check,id={5030,5031,5032},},
  [8]={tp=tk.close,text=1,},
 },
-- --task 5030 complete_talk
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=503031,},
  -- [2]={tp=tk.complete_task,id=5030,text=503032,},
 -- },
-- --task 5031 accept_talk
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=503121,},
  -- [2]={tp=tk.page,id=4,text=503122,},
 -- },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=503123,},
  -- [2]={tp=tk.accept_task,id=5031,text=503124,},
 -- },
-- --task 5031 complete_talk
 -- [5]=
 -- {
  -- [1]={tp=tk.text,text=503131,},
  -- [2]={tp=tk.complete_task,id=5031,text=503132,},
 -- },
-- --task 5032 accept_talk
 -- [6]=
 -- {
  -- [1]={tp=tk.text,text=503221,},
  -- [2]={tp=tk.page,id=7,text=503222,},
 -- },
 -- [7]=
 -- {
  -- [1]={tp=tk.text,text=503223,},
  -- [2]={tp=tk.page,id=11,text=503224,},
 -- },
 -- [11]=
 -- {
  -- [1]={tp=tk.text,text=503225,},
  -- [2]={tp=tk.accept_task,id=5032,text=503226,},
 -- },
-- --task 5032 complete_talk
 -- [8]=
 -- {
  -- [1]={tp=tk.text,text=503231,},
  -- [2]={tp=tk.complete_task,id=5032,text=503232,},
 -- },
-- --task 5033 accept_talk
 -- [9]=
 -- {
  -- [1]={tp=tk.text,text=503321,},
  -- [2]={tp=tk.page,id=10,text=503322,},
 -- },
 -- [10]=
 -- {
  -- [1]={tp=tk.text,text=503323,},
  -- [2]={tp=tk.accept_task,id=5033,text=503324,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]