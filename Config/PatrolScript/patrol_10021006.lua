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
local npc_id = 10021106
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	dwTeamId = 100202;
	[1] = {
		{x=1.30,y=42.42,speed=125};
        {x=21.70,y=42.46,speed=100};
		{x=21.70,y=-1.36,speed=100};
		{x=-27.49,y=-1.43,speed=100};
		{x=-27.49,y=42.47,speed=100};
		{x=1.30,y=42.42,speed=100};
		{x=1.31,y=47.95,speed=100,dir=5.8,dwStay=50000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------