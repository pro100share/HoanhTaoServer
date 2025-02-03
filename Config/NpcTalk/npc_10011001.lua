--单个npc对话:npc_10011001.lua
local npc_id=10011001
local talk=
{
 [1]=
 {
  [1]={tp=tk.text,text=1001100111,},
  [2]={tp=tk.accept_check,id={1004},},
  [3]={tp=tk.complete_check,id={1003},},
  [4]={tp=tk.shop,id=10000,text=7,},
  --[5]={tp=tk.fun,fun="zcs",param={},text=100134,},
  [8]={tp=tk.close,text=1,},
  --[8]={tp=tk.enter_dupl,dupl_id=1001,map_id=5001,text=1,},---调试副本剧情用。尧神手下留情不要干掉。。
 },
--task 1003 complete_talk
 [2]=
 {
  [1]={tp=tk.text,text=100331,},
  [2]={tp=tk.complete_task,id=1003,text=100332,},
 },
--task 1004 accept_talk
 [3]=
 {
  [1]={tp=tk.text,text=100421,},
  [2]={tp=tk.page,id=4,text=100422,},
 },
	[4]=
	{
	 [1]={tp=tk.text,text=100423,},
	 [2]={tp=tk.accept_task,id=1004,text=100424,},
	},
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]