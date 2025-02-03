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
local npc_id = 10121014
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=38.34,y=2.48,speed=450;};	
	};
	[2] = {
		{x=33,y=0,speed=1500;dwActId=1012200513;};	
	};	
	[3] = {
		{x=24,y=-56,speed=1500;dwActId=1012200513;};	
	};	
	[4] = {
		{x=25.41,y=-55.75,speed=1500;};	
		{x=-11,y=-58,speed=1500;};			
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------