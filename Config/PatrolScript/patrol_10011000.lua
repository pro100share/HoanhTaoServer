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
local npc_id = 10011000
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	[1] = {
		{x=-23.08,y=-19.44,speed=100};
        {x=-16.19,y=-20.00,speed=100};
        {x=-15.78,y=-25.58,speed=100};
		{x=-31.76,y=-25.22,speed=100};
		{x=-32.58,y=-31.65,speed=100};
		{x=-38.44,y=-30.72,speed=100};
		{x=-37.67,y=-21.31,speed=100};
		{x=-25.92,y=-22.41,speed=100};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------