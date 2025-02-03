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
local npc_id = 10071030
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-17,y=-4,speed=450};
	};
	[2] = {
		{x=1,y=-7,speed=450};
	};	
	[3] = {
		{x=0,y=-29,speed=250};
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------