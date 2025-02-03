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
local npc_id = 10101011
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=61.26,y=-4.39,speed=450};	
	};
	[2] = {
		{x=72,y=-17,speed=850};
		{x=111.20,y=-16.68,speed=850};		
	};	
	[3] = {
		{x=145.78,y=-16.25,speed=550};	
	};	
	[4] = {
		{x=69,y=-18,speed=850};
		{x=62.43,y=33.33,speed=850};		
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------