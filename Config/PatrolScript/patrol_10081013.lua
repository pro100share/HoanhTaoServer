﻿--[[
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
local npc_id = 10081013
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-0.91,y=40.49,speed=450;};
	};	
	[2] = {
		{x=-3,y=-6,speed=450;};
	};		
	[3] = {
		{x=-3,y=4,speed=450;dwActId=50302007040;};		
	};	
	[4] = {
		{x=-5,y=27,speed=2000;dwActId=50302007040;dwStay=500;};
		{x=-2,y=26,speed=2000;dwActId=5030200715;bPause=1;};		
	};	
	[5] = {
		{x=-7,y=25,speed=1500;dwActId=50302007040;};
	};	
	[6] = {
		{x=0,y=18,speed=450;dwStay=3500;};
		{x=-2,y=9,speed=450;};
		{x=-3,y=-12,speed=450;};
		{x=-8,y=-17,speed=450;};			
	};			
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------