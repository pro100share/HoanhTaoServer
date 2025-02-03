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
local npc_id = 10091114
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-4,y=-1,speed=1000;dwActId=5099000282;};
		{x=-7,y=-1,speed=500;dwActId=5099000281;bPause=1;};		
	};	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------