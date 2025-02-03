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
local npc_id = 10021096
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	dwTeamId = 10021096;
	[1] = {
		{x=-60.47,y=28.67,speed=100};
        {x=-61.70,y=35.97,speed=100};
        {x=-55.20,y=36.58,speed=100};
		{x=-54.87,y=28.67,speed=100};
		{x=-60.47,y=28.67,speed=100};
		{x=-61.70,y=35.97,speed=100};
		{x=-60.47,y=28.67,speed=100};
		{x=-50.82,y=27.49,speed=100,dir=4.9};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------