--单个npc对话:npc_10111016.lua
local npc_id=10111016
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1011101611,},
  [2]={tp=tk.accept_check,id={10060,10061,10063,10069,10070,10075},},
  [3]={tp=tk.complete_check,id={10059,10060,10062,10068,10069,10074},},
  [8]={tp=tk.close,text=1,},
 },
--task 10059 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1005931,},
  [2]={tp=tk.complete_task,id=10059,text=1005932,},
 },
--task 10060 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=1006021,},
  [2]={tp=tk.page,id=4,text=1006022,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1006023,},
  [2]={tp=tk.page,id=5,text=1006024,},
 },
 [5]=
 {
  [1]={tp=tk.text,text=1006025,},
  [2]={tp=tk.accept_task,id=10060,text=1006026,},
 },
--task 10060 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1006031,},
  [2]={tp=tk.complete_task,id=10060,text=1006032,},
 },
--task 10061 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1006121,},
  [2]={tp=tk.page,id=8,text=1006122,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1006123,},
  [2]={tp=tk.accept_task,id=10061,text=1006124,},
 },
--task 10062 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=1006231,},
  [2]={tp=tk.complete_task,id=10062,text=1006232,},
 },
--task 10063 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=1006321,},
  [2]={tp=tk.page,id=11,text=1006322,},
 },
 [11]=
 {
  [1]={tp=tk.text,text=1006323,},
  [2]={tp=tk.page,id=12,text=1006324,},
 },
 [12]=
 {
  [1]={tp=tk.text,text=1006325,},
  [2]={tp=tk.accept_task,id=10063,text=1006326,},
 },
--task 10068 complete_talk
 [13]=
 {
  [1]={tp=tk.text,text=1006831,},
  [2]={tp=tk.complete_task,id=10068,text=1006832,},
 },
--task 10069 accept_talk
 [14]=
 {
  [1]={tp=tk.text,text=1006921,},
  [2]={tp=tk.page,id=15,text=1006922,},
 },
 [15]=
 {
  [1]={tp=tk.text,text=1006923,},
  [2]={tp=tk.accept_task,id=10069,text=1006924,},
 },
--task 10069 complete_talk
 [16]=
 {
  [1]={tp=tk.text,text=1006931,},
  [2]={tp=tk.complete_task,id=10069,text=1006932,},
 },
--task 10070 accept_talk
 [17]=
 {
  [1]={tp=tk.text,text=1007021,},
  [2]={tp=tk.page,id=18,text=1007022,},
 },
 [18]=
 {
  [1]={tp=tk.text,text=1007023,},
  [2]={tp=tk.accept_task,id=10070,text=1007024,},
 },
--task 10074 complete_talk
 [19]=
 {
  [1]={tp=tk.text,text=1007431,},
  [2]={tp=tk.complete_task,id=10074,text=1007432,},
 },
--task 10075 accept_talk
 [20]=
 {
  [1]={tp=tk.text,text=1007521,},
  [2]={tp=tk.accept_task,id=10075,text=1007522,},
 }, 
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]