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
local npc_id = 10061002
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=58,y=-56,speed=550};	
		{x=62,y=-57,speed=550};			
	};
	[2] = {
		{x=58,y=-56,speed=550};	
		{x=58,y=-45,speed=550};			
	};	
	[3]	=	{
		{x=52,y=-37,speed=450};	
		{x=48,y=-48,speed=450};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------