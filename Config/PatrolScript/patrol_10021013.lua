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
local npc_id = 10021113
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	dwTeamId = 100204;
	[1] = {
		{x=-72.35,y=88.08,speed=100};
        {x=-69.38,y=14.73,speed=100};
		{x=-39.24,y=15.32,speed=150,dir=3,dwStay=30000};
        {x=-69.38,y=14.73,speed=100};
		{x=-72.35,y=88.08,speed=100};
		{x=-73.36,y=102.60,speed=100,dir=1.5,dwStay=50000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------