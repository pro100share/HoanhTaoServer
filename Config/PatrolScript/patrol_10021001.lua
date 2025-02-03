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
local npc_id = 10021001
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=10,y=10,speed=1000,dwStay=1,dwActId=0,bPause=true,dwStartSayId=5,dwStopSayId=1};
		{x=11,y=2,speed=1000,dwStay=2000,dwActId=100120016,bPause=true};
		{x=3,y=3,speed=1000,dwStay=1,dwActId=0,bPause=true};
	};
	[2] = {
		bLoop = true;
		{x=1,y=1,speed=3};
		{x=3,y=1,speed=3};
		{x=3,y=3,speed=3};
		{x=5,y=3,speed=3};
		{x=10,y=3,speed=3};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------