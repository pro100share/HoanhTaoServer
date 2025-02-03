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
local npc_id = 10101007
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=16,y=-106,speed=550};			
	};
	[2] = {
		{x=-39,y=80,speed=550};	
		{x=-10,y=79,speed=550};			
	};	
	[3] = {
		{x=37,y=-106,speed=550};			
	};
	[4] = {
		{x=43,y=-106,speed=550};	
	};			

}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------