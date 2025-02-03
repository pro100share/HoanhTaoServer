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
local npc_id = 10121008
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-61,y=32,speed=350};			
	};
	[2]	=	{
		{x=31,y=5,speed=450};			
	};	
	[3]	=	{
		{x=69,y=-25,speed=450};			
	};	
	[4] = {
		{x=25.41,y=-55.75,speed=1500;};	
		{x=-11,y=-58,speed=1500;};			
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------