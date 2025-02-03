--单个npc对话:npc_80901020.lua
local npc_id=80901020
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=8090102011,},
  [2]={tp=tk.complete_check,id={809001,809002,809003,809007,809008,809009,809010,809011,809012,809013,809014,809015,809016},},
  [3]={tp=tk.close,text=1,},
  },
--task 809001 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=80900131,},
  [2]={tp=tk.complete_task,id=809001,text=80900132,},
 },
--task 809002 complete_talk
 [3]=
 {
  [1]={tp=tk.text,text=80900231,},
  [2]={tp=tk.complete_task,id=809002,text=80900232,},
 },
--task 809003 complete_talk
 [4]=
 {
  [1]={tp=tk.text,text=80900331,},
  [2]={tp=tk.complete_task,id=809003,text=80900332,},
 },
--task 809007 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809007,text=80900732,},
 },
--task 809008 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809008,text=80900732,},
 },
--task 809009 complete_talk
 [7]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809009,text=80900732,}
 },
--task 809010 complete_talk
 [8]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809010,text=80900732,}
 }, 
--task 809011 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809011,text=80900732,}
 }, 
--task 809012 complete_talk
 [10]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809012,text=80900732,}
 }, 
--task 809013 complete_talk
 [11]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809013,text=80900732,}
 },
--task 809014 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809014,text=80900732,}
 }, 
--task 809015 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809015,text=80900732,}
 }, 
--task 809016 complete_talk
 [14]=
 {
  [1]={tp=tk.text,text=80900731,},
  [2]={tp=tk.complete_task,id=809016,text=80900732,}
 },  
}


CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]
