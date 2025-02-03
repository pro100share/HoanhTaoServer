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
local npc_id = 10069001
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	[1] = {
		{x=-74.11,y=75.62,speed=200};--,dwStartSayId=1006900101
		{x=-37.13,y=81.35,speed=200};
		{x=-38.48,y=99.81,speed=200};
		{x=-59.54,y=99.19,speed=200};
		{x=-59.54,y=99.19,speed=200};
		{x=-63.43,y=79.54,speed=200};
		{x=-74.01,y=70.31,speed=200};
		{x=-76,y=40,speed=180,dwStay=700};--,dwStopSayId=1006900102
		{x=-77.38,y=38.05,speed=200,dwStay=150000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------