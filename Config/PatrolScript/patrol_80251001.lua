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
local npc_id = 80251001
local Patrol = {
	dwDefault = 1;
	bLoop = true;
	[1] = {
  {x=-4,y=-8,speed=250,dwStay=20000};
  {x=-5,y=-1,speed=250,dwStay=20000};
  {x=2,y=-4,speed=250};
  {x=-1.23,y=-3.87,speed=250,dwStay=20000};  
	};
	
}
-------------------------------------------------------
CScriptManager:AddScript(ScriptTypeConfig.Patrol,npc_id,Patrol)
-------------------------------------------------------