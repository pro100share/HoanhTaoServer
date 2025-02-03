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
local npc_id = 10011022
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-22,y=-20,speed=450,dwStay=0};		
	};
	[2] = {
		{x=-42,y=-14,speed=500};	
	};	
	[3] = {
		{x=-38,y=-21,speed=600};		
	};	
	[4] = {
		{x=-36,y=-38,speed=600};		
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------