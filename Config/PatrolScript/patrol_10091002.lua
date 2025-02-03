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
local npc_id = 10091002
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=25,y=-73,speed=550};	
	};
	[2] = {
		{x=27,y=-69,speed=550;dwActId=5099000181;bPause=1;};	
	};	
	[3] = {
		{x=-2.75,y=-3.51,speed=150;dwActId=5099000180;};	
	};
	[4] = {
		{x=2.96,y=-3.51,speed=150;dwActId=5099000180;};	
	};
	[5] = {
		{x=0.64,y=-4.74,speed=150;};			
		{x=0.39,y=-3.39,speed=150;dwActId=5099000180;};	
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------