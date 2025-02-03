--单个npc对话:npc_10011002.lua
local npc_id=10011002
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100211,},
  [2]={tp=tk.accept_check,id={1019,1020},},
  [3]={tp=tk.complete_check,id={1018,1019},},
  --[4]={tp=tk.storage,text=13,},
  --[5]={tp=tk.dupl,id=1001,mapid=5001,text=111,},
  --[6]={tp=tk.dupl,id=1004,mapid=5030,text=222,},
  --[7]={tp=tk.dupl,id=1003,mapid=5004,text=333,},
  [8]={tp=tk.close,text=1,},
 },
--task 1018 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=101831,},
  [2]={tp=tk.complete_task,id=1018,text=101832,},
 },
--task 1019 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=101921,},
  [2]={tp=tk.page,id=4,text=101922,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=101923,},
  [2]={tp=tk.accept_task,id=1019,text=101924,},
 },
--task 1019 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=101931,},
  [2]={tp=tk.complete_task,id=1019,text=101932,},
 },
--task 1020 accept_talk
 [6]=
 {
  [1]={tp=tk.text,text=102021,},
  [2]={tp=tk.page,id=7,text=102022,},
 },
 [7]=
 {
  [1]={tp=tk.text,text=102023,},
  [2]={tp=tk.accept_task,id=1020,text=102024,},
 },
}

CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]