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
local npc_id = 10111002
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-89,y=-45,speed=450};			
	};
	[2] = {
		{x=-84,y=-43,speed=450};	
		{x=-80,y=-38,speed=450};
		{x=-79,y=-39,speed=450;};		
	};	
	[3] = {
		{x=-79,y=-45,speed=450;dwActId=1010201780;};			
	};	
	[4] = {
		{x=-73,y=-43,speed=450};			
	};
	[5] = {
		{x=-64,y=-41,speed=600};			
	};	
	[6] = {
		{x=-52,y=-43,speed=600};			
	};	
	[7] = {
		{x=-76,y=-44,speed=450};			
	};
	[8] = {
		{x=-45,y=-103,speed=250};			
	};
	[9] = {
		{x=-43,y=-107,speed=350;dwStay=2000;};	
		{x=-50,y=-82,speed=350};	
		{x=-45,y=-69,speed=350};				
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------