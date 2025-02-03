--单个npc对话:npc_10021001.lua
local npc_id=10021093

local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=85},
	[2]={tp=tk.task_fun,id=32,text=86,},
	[3]={tp=tk.task_fun,id=44,text=87,},
	[4]={tp=tk.task_fun,id=45,text=89,},
	--[5]={tp=tk.task_fun,id=57,text=97,},
 },
}



CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)




 -- [1]=
 -- {
  -- [1]={tp=tk.text,text=200111,},
  -- [2]={tp=tk.accept_check,id={2037,4031,6024,2114,2115},},
  -- [3]={tp=tk.complete_check,id={1022,2036,3029,4030,6023,2114,2115},},
  -- [8]={tp=tk.close,text=1,},
 -- },
-- --task 1022 complete_talk 
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=102331,},
  -- [2]={tp=tk.complete_task,id=1022,text=102332,},
 -- },
-- --task 2036 complete_talk
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=203631,},
  -- [2]={tp=tk.complete_task,id=2036,text=203632,},
 -- },
-- --task 2037 accept_talk
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=203721,},
  -- [2]={tp=tk.page,id=5,text=203722,},
 -- },
 -- [5]=
 -- {
  -- [1]={tp=tk.text,text=203723,},
  -- [2]={tp=tk.accept_task,id=2037,text=203724,},
 -- },
-- --task 3029 complete_talk
 -- [13]=
 -- {
  -- [1]={tp=tk.text,text=302931,},
  -- [2]={tp=tk.complete_task,id=3029,text=302932,},
 -- },
-- --task 4030 complete_talk
 -- [32]=
 -- {
  -- [1]={tp=tk.text,text=403031,},
  -- [2]={tp=tk.complete_task,id=4030,text=403032,},
 -- },
-- --task 4031 accept_talk
 -- [33]=
 -- {
  -- [1]={tp=tk.text,text=403121,},
  -- [2]={tp=tk.page,id=34,text=403122,},
 -- },
 -- [34]=
 -- {
  -- [1]={tp=tk.text,text=403123,},
  -- [2]={tp=tk.accept_task,id=4031,text=403124,},
 -- },
-- --task 6023 complete_talk
 -- [35]=
 -- {
  -- [1]={tp=tk.text,text=602331,},
  -- [2]={tp=tk.complete_task,id=6023,text=602332,},
 -- },
-- --task 6024 accept_talk
 -- [36]=
 -- {
  -- [1]={tp=tk.text,text=602421,},
  -- [2]={tp=tk.page,id=37,text=602422,},
 -- },
 -- [37]=
 -- {
  -- [1]={tp=tk.text,text=602423,},
  -- [2]={tp=tk.accept_task,id=6024,text=602424,},
 -- }, 
-- --task 2103 accept_talk
 -- [38]=
 -- {
  -- [1]={tp=tk.text,text=210321,},
  -- [2]={tp=tk.accept_task,id=2103,text=210322,},
 -- },
-- --task 2114 accept_talk
 -- [39]=
 -- {
  -- [1]={tp=tk.text,text=211421,},
  -- [2]={tp=tk.page,id=40,text=211422,},
 -- },
 -- [40]=
 -- {
  -- [1]={tp=tk.text,text=211423,},
  -- [2]={tp=tk.accept_task,id=2114,text=211424,},
 -- },
-- --task 2114 complete_talk
 -- [41]=
 -- {
  -- [1]={tp=tk.text,text=211431,},
  -- [2]={tp=tk.complete_task,id=2114,text=211432,},
 -- },
-- --task 2115 accept_talk
 -- [42]=
 -- {
  -- [1]={tp=tk.text,text=211521,},
  -- [2]={tp=tk.page,id=43,text=211522,},
 -- },
 -- [43]=
 -- {
  -- [1]={tp=tk.text,text=211523,},
  -- [2]={tp=tk.accept_task,id=2115,text=211524,},
 -- },
-- --task 2115 complete_talk
 -- [44]=
 -- {
  -- [1]={tp=tk.text,text=211531,},
  -- [2]={tp=tk.complete_task,id=2115,text=211532,},
 -- },


--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]