--单个npc对话:npc_10021006.lua
local npc_id=10021006
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=200611,},
  [2]={tp=tk.accept_check,id={2104,2125},},
  [3]={tp=tk.complete_check,id={2104,20701},},
  [5]={tp=tk.find_npc,id={20701},},  
  [8]={tp=tk.close,text=1,},
 },
 
 [2] = 
 {--在脚本里改
 };
 [3] = {--答错
			[1]={tp=tk.text,text=1177443303,},
			[2]={tp=tk.page,id=2,text=1177443304,},
 },
 [4] = {--答对
			[1]={tp=tk.text,text=1177443305,},
			[2]={tp=tk.talk_over,id=20701,text=1177443306,},
 },
 
--task 2104 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=210421,},
  [2]={tp=tk.page,id=18,text=210422,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=210423,},
  [2]={tp=tk.accept_task,id=2104,text=210424,},
 },
--task 2104 complete_talk
 [19]=
 {
  [1]={tp=tk.text,text=210431,},
  [2]={tp=tk.complete_task,id=2104,text=210432,},
 },
--task 2125 accept_talk
 [20]=
 {
  [1]={tp=tk.text,text=212521,},
  [2]={tp=tk.page,id=21,text=212522,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=212523,},
  [2]={tp=tk.page,id=22,text=212524,},
 },
 [22]=
 {
  [1]={tp=tk.text,text=212525,},
  [2]={tp=tk.accept_task,id=2125,text=212526,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]