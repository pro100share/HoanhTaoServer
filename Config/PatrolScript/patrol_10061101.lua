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
local npc_id = 10061101
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-75.53,y=69.8,speed=650};			
	};
	[2] = {
		{x=-71.3,y=73.8,speed=450};
		{x=-49,y=74,speed=450};		
	};	
	[3] = {
		{x=-43,y=73,speed=500,};
		{x=-37,y=58,speed=600};
		{x=-38,y=42,speed=600};
		{x=-39,y=31,speed=600};		
		{x=-27,y=9,speed=600};
		{x=-16,y=3,speed=600};	
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------