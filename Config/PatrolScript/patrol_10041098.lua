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
local npc_id = 10041098
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-59,y=77,speed=450};		
	};
	[2] = {
		{x=-56,y=80,speed=450;dwActId=1001101180;bPause=1;};		
	};	
	[3] = {
		{x=-67,y=71,speed=450};		
		{x=-61,y=74,speed=450};		
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------