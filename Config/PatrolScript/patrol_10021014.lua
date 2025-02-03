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
local npc_id = 10021114
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	dwTeamId = 100205;
	[1] = {
		{x=12.35,y=-63.86,speed=100};
        {x=-29.19,y=-67.89,speed=100};
		{x=-46.95,y=-72.36,speed=100};
        {x=-58.71,y=-81.37,speed=100};
		{x=-82.37,y=-83.11,speed=100};
		{x=-90.07,y=-78.78,speed=100};
		{x=-96.19,y=-83.25,speed=100};
		{x=-118.48,y=-92.55,speed=100};
		{x=-103.18,y=-102.40,speed=100};
		{x=-88.30,y=-98.88,speed=100};
		{x=-77.84,y=-106.41,speed=100};
		{x=-61.27,y=-108.84,speed=100};
		{x=-45.87,y=-124.45,speed=100};
		{x=-2.64,y=-124.44,speed=100};
		{x=0.09,y=-63.67,speed=100};
		{x=23.51,y=-59.40,speed=100,dir=4.5,dwStay=50000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------