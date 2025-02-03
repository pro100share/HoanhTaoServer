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
local npc_id = 10111004
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-69,y=-46,speed=450};			
	};
	[2] = {
		{x=14,y=-23,speed=450};			
	};	
	-- [3] = {
		-- {x=9,y=-20,speed=1500;dwActId=1010200790;};			
	-- };	
	[4] = {
		{x=14,y=-23,speed=450};			
	};		
	[5] = {
		{x=-33,y=-89,speed=450};			
	};	
	[6] = {
		{x=-46,y=-108,speed=450};
		{x=-38,y=-106,speed=450;dwActId=1010201980;};		
	};	
	[7] = {
		{x=-45,y=-108,speed=600};
		{x=-47,y=-70,speed=600};		
	};	
	-- [8] = {
		-- {x=11,y=-20,speed=450};			
	-- };
	-- [9] = {
		-- {x=22,y=-20,speed=450};	
		-- {x=37,y=-38,speed=450};			
	-- };	
	[10] = {
		{x=39,y=-51,speed=450};	
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------