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
local npc_id = 10111009
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-10.54,y=-8.39,speed=450};

	};
	[2] = {
		{x=-11,y=-10,speed=450;dwStopSayId=1003142;};		
	};	
	[3] = {
		{x=-9.99,y=-6.10,speed=450;dwActId=10061002080;};		
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------