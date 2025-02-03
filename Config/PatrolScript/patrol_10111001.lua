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
local npc_id = 10111001
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-85,y=-47,speed=250};			
	};
	[2] = {
		{x=-78,y=-46,speed=250};			
	};	
	[3] = {
		{x=14,y=-23,speed=250};			
	};
	[4] = {
		{x=8.86,y=-19.56,speed=250};			
	};	
	[5] = {
		{x=6,y=-24,speed=350};			
	};	
	[6] = {
		{x=2,y=-20,speed=250;dwActId=1011201613;};			
	};	
	[7] = {
		{x=8,y=-21,speed=450};			
	};	
	[8] = {
		{x=33,y=-83,speed=450;dwActId=1011201613;};
	};	
	[9] = {
		{x=40,y=-50,speed=450};	
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------