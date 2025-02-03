--单个npc对话:npc_10061006.lua
local npc_id=10061006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1006100611,},
  [2]={tp=tk.accept_check,id={5040},},
  [3]={tp=tk.complete_check,id={5039},},
  [8]={tp=tk.close,text=1,},
 },
--task 5039 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=503931,},
  [2]={tp=tk.page,id=5,text=503932,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=503933,},
  [2]={tp=tk.page,id=6,text=503934,},
  [3]={tp=tk.page,id=7,text=503935,},
  [4]={tp=tk.page,id=8,text=503936,},
 },
 [6]=
 {
  [1]={tp=tk.text,text=503941,},
  [2]={tp=tk.fun,fun="shuaguai",text=503942,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=503943,},
  [2]={tp=tk.page,id=9,text=503944,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=503949,},
  [2]={tp=tk.fun,fun="shuaguai",text=503950,},
 },
 [9]=
 {
  [1]={tp=tk.text,text=503945,},
  [2]={tp=tk.page,id=10,text=503946,},
 },
 [10]=
 {
  [1]={tp=tk.text,text=503947,},
  [2]={tp=tk.complete_task,id=5039,text=503948,},
 },
--task 5040 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=504021,},
  [2]={tp=tk.accept_task,id=5040,text=504022,},
 },
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=504023,},
  -- [2]={tp=tk.accept_task,id=5040,text=504024,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 