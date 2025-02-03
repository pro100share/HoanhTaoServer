--[[
	[ \brief 通天塔系统消息文件
	[ \author 李中昌
	[ \date 2014-6-9
	[ 处理通天塔系统消息
	]]

-- 通天塔 请求挑战
define.TongTianTowerChallengeMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
	-- 是否是副本内死亡 再来一次
	bIsDead			= false;
}
when {user = NONE}
TongTianTowerChallengeMsg = checkUser;
when{}
function TongTianTowerChallengeMsg(user, bIsDead)
	local oSystem = user:GetSystem("CTongTianTowerSystem");
	if oSystem then
		oSystem:Challenge(bIsDead);
	end
end

-- 通天塔 请求重置
define.TongTianTowerResetMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
}
when {user = NONE}
TongTianTowerResetMsg = checkUser;
when{}
function TongTianTowerResetMsg(user)
	local oSystem = user:GetSystem("CTongTianTowerSystem");
	if oSystem then
		oSystem:GoldReset();
	end
end

-- 通天塔副本时间到 算失败
define.TongTianTowerTimeoutMsg
{
	-- 默认参数 玩家对象
	user			= NONE,
}
when {user = NONE}
TongTianTowerTimeoutMsg = checkUser;
when{}
function TongTianTowerTimeoutMsg(user)
	_info("TongTianTowerTimeoutMsg============1")
	local oSystem = user:GetSystem("CTongTianTowerSystem");
	if oSystem then
		oSystem:OnTimeout();
	end
end

-- 通天塔排行榜更新
define.TongTianTowerChartUpdateMsg
{
	-- 排行榜信息
	tChart = {},
}
when{}
function TongTianTowerChartUpdateMsg(tChart)
	CTongTianTowerChartManager:Update(tChart);
end

-- 广播
define.TongTianTowerBoardcastMsg
{	
	-- 广播类型 1通关,  2成为上周擂主
	Type = 0,
	-- 玩家的roleID
	RoleID = 0,
	-- 玩家的角色名
    RoleName = "",
	-- 进度
	Layer = 0,
}
when{}
function TongTianTowerBoardcastMsg(Type, RoleID, RoleName, Layer)
	local tNet = {};
	for i,oPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(tNet, oPlayer.objNet);
	end
	_groupcallout(tNet, "TongTianTowerBoardcastMsg", {Type = Type, 
		RoleID = RoleID, RoleName = RoleName, Layer = Layer});	
end
