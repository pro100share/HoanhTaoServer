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
local npc_id = 10011011
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-41,y=-87,speed=550;};		
		{x=-31,y=-86,speed=550,dwStartSayId=100242;};
		{x=-15,y=-82,speed=500,dwStartSayId=100243;};	
		{x=-16,y=-63,speed=450,dwStartSayId=100244;};	
	};
	[2] = {
		{x=28,y=-12,speed=450};	
		{x=51,y=-12,speed=450};
		};
	[3] = {
		{x=-14,y=-47,speed=450,dwStartSayId=100342;};
		{x=-11,y=-44,speed=450,dwStartSayId=100343;};		
	};		
	[4] = {
		{x=31,y=-46,speed=350};	
		};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------