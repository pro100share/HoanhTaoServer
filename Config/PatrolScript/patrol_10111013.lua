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
local npc_id = 10111013
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=5,y=-16,speed=450};
		{x=5,y=-18,speed=1500;dwActId=10112012080;};
		{x=2,y=-25,speed=450};
		{x=2,y=-23,speed=1500;dwActId=10112012080;};
		{x=-2,y=-16,speed=450};
		{x=-3,y=-18,speed=1500;dwActId=10112012080;};		
	};
	[2] = {
		{x=7,y=-20,speed=600};			
	};
	[3] = {
		{x=-15,y=-20,speed=350};			
	};		
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------