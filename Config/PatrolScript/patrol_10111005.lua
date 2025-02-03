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
local npc_id = 10111005
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-38,y=-89,speed=550};			
	};
	[2] = {
		{x=-48,y=-87,speed=350};	
		{x=-47,y=-72,speed=350};
		{x=-34,y=-70,speed=350};			
	};
	[3] = {
		{x=27,y=-25,speed=450};
		{x=34,y=-32,speed=450};		
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------