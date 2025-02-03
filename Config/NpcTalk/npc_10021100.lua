--单个npc对话:npc_10021100.lua
local npc_id=10021100
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1002110011,};
  --[2]={tp=tk.daily,};
  --[3]={tp=tk.weekly,};
  [4]={tp=tk.close,text=1,};
 },
-- --task 惩恶
 -- [2]=
 -- {
  -- [1]={tp=tk.text,text=1001,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 筹资
 -- [3]=
 -- {
  -- [1]={tp=tk.text,text=1003,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 刺探
 -- [4]=
 -- {
  -- [1]={tp=tk.text,text=1004,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 完成
 -- [5]=
 -- {
  -- [1]={tp=tk.text,text=2001,},
  -- [2]={tp=tk.complete_daily,text=2002,},
 -- },
-- --task 打怪
 -- [6]=
 -- {
  -- [1]={tp=tk.text,text=1001,},
  -- [2]={tp=tk.accept_weekly,text=1002,},
 -- },
-- --task 物资
 -- [7]=
 -- {
  -- [1]={tp=tk.text,text=1003,},
  -- [2]={tp=tk.accept_weekly,text=1002,},
 -- },
-- --task 情报 
 -- [8]=
 -- {
  -- [1]={tp=tk.text,text=1004,},
  -- [2]={tp=tk.accept_weekly,text=1002,},
 -- },
-- --task 完成
 -- [9]=
 -- {
  -- [1]={tp=tk.text,text=2001,},
  -- [2]={tp=tk.complete_weekly,text=2002,},
 -- }, 
-- --task 收缴
 -- [10]=
 -- {
  -- [1]={tp=tk.text,text=1005,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 求贤
 -- [11]=
 -- {
  -- [1]={tp=tk.text,text=1006,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 轶闻
 -- [12]=
 -- {
  -- [1]={tp=tk.text,text=1007,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 杂务
 -- [13]=
 -- {
  -- [1]={tp=tk.text,text=1008,},
  -- [2]={tp=tk.accept_daily,text=1002,},
 -- },
-- --task 未完成
 -- [20]=
 -- {
  -- [1]={tp=tk.text,text=2003,},
  -- [2]={tp=tk.close,text=1,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]] 