--[[
	npc寻路配置
	-----------
	dwDefault = 默认寻路id
	bLoop = 是否循环
	x，y = 走到这个坐标
	speed = 速度
	dwStay = 走到后，停在那多久
	dwActId = 走到后播这个动作
	bPause = 播完这个动作后是不是停住（不返回待机动作）
	dwStartSayId = 开始走时说得话
	dwStopSayId = 走到时说的话
	-----------
--]]
local npc_id = 10101005
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-93,y=-52,speed=650};	
	};
	[2] = {
		{x=-88,y=-71,speed=650};		
		{x=-80.45,y=-85.25,speed=650};	
	};
	[3] = {
		{x=61,y=-10,speed=450;dwStartSayId=906142;};	
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------