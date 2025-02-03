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
local npc_id = 10069002
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	[1] = {
		{x=-75.83,y=74.94,speed=200};--,dwStartSayId=1006900201
		{x=-37.13,y=81.35,speed=200};
		{x=-38.56,y=97.26,speed=200};
		{x=-22,y=77,speed=350};
		{x=-34,y=69,speed=350};
		{x=-48,y=75,speed=350};
		{x=-73,y=75,speed=200};
		{x=-72,y=36,speed=260};--,dwStopSayId=1006900202
		{x=-74.13,y=35.20,speed=200,dwStay=150000};
	};
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------