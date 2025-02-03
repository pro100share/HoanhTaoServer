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
local npc_id = 10061102
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-77.66,y=71.25,speed=650};			
	};
	[2] = {
		{x=-73.26,y=75.65,speed=450};
		{x=-49,y=78,speed=450};		
	};	
	-- [3] = {
		-- {x=-43,y=74,speed=450};
		-- {x=-37,y=66,speed=450};	
		-- {x=-28,y=8,speed=450};			
	-- };		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------