--单个npc对话:npc_50771001.lua
local npc_id=50771001
local talk=
{
 [1]=
 {
	[1]={tp=tk.text,text=703,},
	[2]={tp=tk.fun,sort=1,fun="zcs1",param={},text=701,},	--车轮战
	[3]={tp=tk.fun,sort=1,fun="zcs2",param={},text=702,},	--大乱斗
	-- [4]={tp=tk.page,id=2,text=700,},	--离开副本
 },
 -- [2]=
 -- {
	-- [1]={tp=tk.text,text=751,},
	-- [2]={tp=tk.fun,sort=1,fun="zcs3",param={},text=752,},	--确定
	-- [3]={tp=tk.close,text=1,},
 -- },
}
CScriptManager:AddScript(ScriptTypeConfig.NpcTalk,npc_id,talk)
--文件结束
--[[
说明：
talk[1] : npc对话的入口，每次点击npc，弹出的都是这个对话
			每个npc都有talk[1],其余可有可无;
--]]