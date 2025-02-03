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
local npc_id = 10069004
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	[1] = {
		{x=-12.27,y=74.89,speed=200};
		{x=-20.09,y=58.56,speed=200};
		{x=-49.67,y=79.87,speed=200};
		{x=-30.04,y=101.55,speed=200};
		{x=-10.93,y=81.52,speed=200};
		{x=3.29,y=71.57,speed=200};
		{x=3.12,y=72.55,speed=200,dwStay=120000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------