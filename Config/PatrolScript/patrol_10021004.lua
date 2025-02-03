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
local npc_id = 10021104
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	dwTeamId = 100201;
	[1] = {
		{x=53.63,y=15.95,speed=100,dir=4.5};
        {x=53.71,y=26.31,speed=100};
		{x=122.60,y=26.98,speed=100};
		{x=119.70,y=14.34,speed=100,dir=2.5,dwStay=50000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------