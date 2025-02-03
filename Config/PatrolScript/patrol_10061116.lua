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
local npc_id = 10061116
local Patrol = {
	dwDefault = nil;
	bLoop = nil;
	[1] = {
		{x=-6,y=-21,speed=750;dwActId=1006200517;};
		{x=-21,y=-21,speed=650;dwActId=1006200517;};
		{x=-30,y=-32,speed=650;dwStopSayId=501346;};	
		{x=-30,y=-32,speed=650;};
		{x=-32,y=-40,speed=650;dwStopSayId=501346;dwActId=1006200517;};
		{x=-45,y=-41,speed=650;};
		{x=-41,y=-25,speed=650;};
		{x=-37,y=0,speed=650;dwStopSayId=501346;dwActId=1006200517;};			
	};
	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------