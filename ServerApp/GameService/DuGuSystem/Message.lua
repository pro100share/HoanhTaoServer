--[[
	[\brief 定义服务器需要接收的消息
	[\author 王凌波
	[\date 2014-5-30
	[定义了服务器需要接收的消息的名称、参数
	[规定了各个消息的响应方法
  ]]

--[[
	[\brief 定义点击修炼消息
	[定义点击修炼消息的名称、参数
	[\param number nPracticeID 修炼类型id，1是初级修炼，2是中级修炼，3是高级修炼
	[\param number nTimes 玩家请求的修炼次数
  ]]
define.DuGuJiuJian_OnHitPracticeMsg
{
	user 			= NONE,
	nPracticeID  	= 0,
	nTimes 			= 0,
}

when {user = NONE}
DuGuJiuJian_OnHitPracticeMsg = checkUser;
when{}

function DuGuJiuJian_OnHitPracticeMsg(user, nPracticeID, nTimes)
	local DuGuSystem = user:GetSystem("CDuGuSystem");
	if DuGuSystem then
		DuGuSystem:OnHitPractice(nPracticeID, nTimes);
	end
end


--[[
	[\brief 定义点击剑套装消息
	[定义点击剑套装消息的名称、参数
	[\param number nSwordID 玩家点击的剑套装id
  ]]
define.DuGuJiuJian_OnHitActivateMsg
{
	user 		= NONE,
	nSwordID  	= 0,
}

when {user = NONE}
DuGuJiuJian_OnHitActivateMsg = checkUser;
when{}

function DuGuJiuJian_OnHitActivateMsg(user, nSwordID)
	local DuGuSystem = user:GetSystem("CDuGuSystem");
	if DuGuSystem then
		DuGuSystem:OnHitActivate(nSwordID);
	end
end

--[[
	[\brief 定义点击查看界面消息
	[定义点击查看界面消息的名称、参数
	[\param number dwRoleId 要查看的其他玩家的角色id
  ]]
define.DuGuJiuJian_OnHitCheckOtherMsg
{
	user 		= NONE,
	dwRoleId 	= 0,
}

when {user = NONE}
DuGuJiuJian_OnHitCheckOtherMsg = checkUser;
when{}

function DuGuJiuJian_OnHitCheckOtherMsg(user, dwRoleId)
	local DuGuSystem = user:GetSystem("CDuGuSystem");
	if DuGuSystem then
		DuGuSystem:OnHitCheckOther(dwRoleId);
	end
end
