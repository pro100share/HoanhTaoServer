--单个npc对话:npc_10131001.lua
local npc_id=10131001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1013100111,},
  [2]={tp=tk.accept_check,id={12001,12002,12006,12008,12010,12013,12017,12020,12023,12025,12026,12028,12029,12032,12034,12035,12037,12038,12043,12047},},
  [3]={tp=tk.complete_check,id={11077,12001,12005,12007,12009,12012,12016,12019,12022,12024,12025,12027,12028,12031,12033,12034,12036,12037,12042,12046},},
  [4]={tp=tk.close,text=1,},
 },
--task 11077 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=1107731,},
  [2]={tp=tk.complete_task,id=11077,text=1107732,},
 },
--task 12001 accept_check
 [3]=
 {
  [1]={tp=tk.text,text=1200121,},
  [2]={tp=tk.page,id=4,text=1200122,},
 },
 [4]=
 {
  [1]={tp=tk.text,text=1200123,},
  [2]={tp=tk.accept_task,id=12001,text=1200124,},
 },
--task 12001 complete_talk
 [5]=
 {
  [1]={tp=tk.text,text=1200131,},
  [2]={tp=tk.complete_task,id=12001,text=1200132,},
 },
--task 12002 accept_talk
 [29]=
	{
	 [1]={tp=tk.text,text=1200221,},
	 [2]={tp=tk.accept_task,id=12002,text=1200222,},
	},
--task 12005 complete_talk
 [6]=
 {
  [1]={tp=tk.text,text=1200531,},
  [2]={tp=tk.complete_task,id=12005,text=1200532,},
 },
--task 12006 accept_talk
 [7]=
 {
  [1]={tp=tk.text,text=1200621,},
  [2]={tp=tk.page,id=8,text=1200622,},
 },
 [8]=
 {
  [1]={tp=tk.text,text=1200623,},
  [2]={tp=tk.accept_task,id=12006,text=1200624,},
 },
--task 12007 complete_talk
 [9]=
 {
  [1]={tp=tk.text,text=1200731,},
  [2]={tp=tk.complete_task,id=12007,text=1200732,},
 },
--task 12008 accept_talk
 [10]=
 {
  [1]={tp=tk.text,text=1200821,},
  [2]={tp=tk.accept_task,id=12008,text=1200822,},
 },
--task 12009 complete_talk
 [12]=
 {
  [1]={tp=tk.text,text=1200931,},
  [2]={tp=tk.complete_task,id=12009,text=1200932,},
 },
--task 12010 accept_talk
 [13]=
 {
  [1]={tp=tk.text,text=1201021,},
  [2]={tp=tk.page,id=14,text=1201022,},
 },
 [14]=
 {
  [1]={tp=tk.text,text=1201023,},
  [2]={tp=tk.accept_task,id=12010,text=1201024,},
 },
--task 12012 complete_talk
 [15]=
	{
	 [1]={tp=tk.text,text=1201231,},
	 [2]={tp=tk.complete_task,id=12012,text=1201232,},
	}, 
--task 12013 accept_talk
 [16]=
 {
  [1]={tp=tk.text,text=1201321,},
  [2]={tp=tk.page,id=17,text=1201322,},
 },
 [17]=
 {
  [1]={tp=tk.text,text=1201323,},
  [2]={tp=tk.accept_task,id=12013,text=1201324,},
 },
--task 12016 complete_talk
 [18]=
 {
  [1]={tp=tk.text,text=1201631,},
  [2]={tp=tk.complete_task,id=12016,text=1201632,},
 },
--task 12017 accept_talk
 [19]=
 {
  [1]={tp=tk.text,text=1201721,},
  [2]={tp=tk.page,id=20,text=1201722,},
 },
 [20]=
 {
  [1]={tp=tk.text,text=1201723,},
  [2]={tp=tk.page,id=21,text=1201724,},
 },
 [21]=
 {
  [1]={tp=tk.text,text=1201725,},
  [2]={tp=tk.accept_task,id=12017,text=1201726,},
 },
--task 12019 complete_talk
 [22]=
 {
  [1]={tp=tk.text,text=1201931,},
  [2]={tp=tk.complete_task,id=12019,text=1201932,},
 },
--task 12020 accept_talk
 [23]=
 {
  [1]={tp=tk.text,text=1202021,},
  [2]={tp=tk.page,id=24,text=1202022,},
 },
 [24]=
 {
  [1]={tp=tk.text,text=1202023,},
  [2]={tp=tk.accept_task,id=12020,text=1202024,},
 },
--task 12022 complete_talk
 [25]=
 {
  [1]={tp=tk.text,text=1202231,},
  [2]={tp=tk.complete_task,id=12022,text=1202232,},
 },
--task 12023 accept_talk
 [26]=
 {
  [1]={tp=tk.text,text=1202321,},
  [2]={tp=tk.page,id=27,text=1202322,},
 },
 [27]=
 {
  [1]={tp=tk.text,text=1202323,},
  [2]={tp=tk.accept_task,id=12023,text=1202324,},
 },
--task 12024 complete_talk
 [28]=
 {
  [1]={tp=tk.text,text=1202431,},
  [2]={tp=tk.complete_task,id=12024,text=1202432,},
 },
--task 12025 accept_talk
 [30]=
 {
  [1]={tp=tk.text,text=1202521,},
  [2]={tp=tk.page,id=31,text=1202522,},
 },
 [31]=
 {
  [1]={tp=tk.text,text=1202523,},
  [2]={tp=tk.accept_task,id=12025,text=1202524,},
 },
--task 12025 complete_talk
 [32]=
 {
  [1]={tp=tk.text,text=1202531,},
  [2]={tp=tk.complete_task,id=12025,text=1202532,},
 },
--task 12026 accept_talk
 [33]=
 {
  [1]={tp=tk.text,text=1202621,},
  [2]={tp=tk.page,id=34,text=1202622,},
 },
 [34]=
 {
  [1]={tp=tk.text,text=1202623,},
  [2]={tp=tk.accept_task,id=12026,text=1202624,},
 },
--task 12027 complete_talk
 [35]=
 {
  [1]={tp=tk.text,text=1202731,},
  [2]={tp=tk.complete_task,id=12027,text=1202732,},
 },
--task 12028 accept_talk
 [36]=
 {
  [1]={tp=tk.text,text=1202821,},
  [2]={tp=tk.page,id=37,text=1202822,},
 },
 [37]=
 {
  [1]={tp=tk.text,text=1202823,},
  [2]={tp=tk.accept_task,id=12028,text=1202824,},
 },
--task 12028 complete_talk
 [38]=
 {
  [1]={tp=tk.text,text=1202831,},
  [2]={tp=tk.complete_task,id=12028,text=1202832,},
 },
--task 12029 accept_talk
 [39]=
 {
  [1]={tp=tk.text,text=1202921,},
  [2]={tp=tk.accept_task,id=12029,text=1202922,},
 },
--task 12031 complete_talk
 [40]=
 {
  [1]={tp=tk.text,text=1203131,},
  [2]={tp=tk.complete_task,id=12031,text=1203132,},
 },
--task 12032 accept_talk
 [41]=
 {
  [1]={tp=tk.text,text=1203221,},
  [2]={tp=tk.accept_task,id=12032,text=1203222,},
 },
--task 12033 complete_talk
 [42]=
 {
  [1]={tp=tk.text,text=1203331,},
  [2]={tp=tk.complete_task,id=12033,text=1203332,},
 },
--task 12034 accept_talk
 [43]=
 {
  [1]={tp=tk.text,text=1203421,},
  [2]={tp=tk.page,id=44,text=1203422,},
 },
 [44]=
 {
  [1]={tp=tk.text,text=1203423,},
  [2]={tp=tk.accept_task,id=12034,text=1203424,},
 },
--task 12034 complete_talk
 [45]=
 {
  [1]={tp=tk.text,text=1203431,},
  [2]={tp=tk.complete_task,id=12034,text=1203432,},
 },
--task 12035 accept_talk 
 [46]=
 {
  [1]={tp=tk.text,text=1203521,},
  [2]={tp=tk.page,id=47,text=1203522,},
 },
 [47]=
 {
  [1]={tp=tk.text,text=1203523,},
  [2]={tp=tk.accept_task,id=12035,text=1203524,},
 },
--task 12036 complete_talk
 [48]=
 {
  [1]={tp=tk.text,text=1203631,},
  [2]={tp=tk.complete_task,id=12036,text=1203632,},
 },
--task 12037 accept_talk 
 [49]=
 {
  [1]={tp=tk.text,text=1203721,},
  [2]={tp=tk.page,id=50,text=1203722,},
 },
 [50]=
 {
  [1]={tp=tk.text,text=1203723,},
  [2]={tp=tk.accept_task,id=12037,text=1203724,},
 },
--task 12037 complete_talk
 [51]=
	{
	 [1]={tp=tk.text,text=1203731,},
	 [2]={tp=tk.complete_task,id=12037,text=1203732,},
	},
--task 12038 accept_talk
 [52]=
 {
  [1]={tp=tk.text,text=1203821,},
  [2]={tp=tk.accept_task,id=12038,text=1203822,},
 },
--task 12042 complete_talk
 [53]=
 {
  [1]={tp=tk.text,text=1204231,},
  [2]={tp=tk.complete_task,id=12042,text=1204232,},
 }, 
--task 12043 accept_talk 
 [54]=
 {
  [1]={tp=tk.text,text=1204321,},
  [2]={tp=tk.page,id=55,text=1204322,},
 },
 [55]=
 {
  [1]={tp=tk.text,text=1204323,},
  [2]={tp=tk.accept_task,id=12043,text=1204324,},
 },
--task 12046 complete_talk
 [56]=
 {
  [1]={tp=tk.text,text=1204631,},
  [2]={tp=tk.complete_task,id=12046,text=1204632,},
 },
--task 12047 accept_talk 
 [57]=
 {
  [1]={tp=tk.text,text=1204721,},
  [2]={tp=tk.page,id=58,text=1204722,},
 },
 [58]=
 {
  [1]={tp=tk.text,text=1204723,},
  [2]={tp=tk.accept_task,id=12047,text=1204724,},
 },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]