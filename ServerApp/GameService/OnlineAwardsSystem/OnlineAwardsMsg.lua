--[[
	--功能：在线礼包系统消息
	--作者：魏云
	--时间：2013-11-29
--]]

--玩家开始摇奖
define.RequestStartShakeAwardMsg
{
	user = NONE,
};
when {user = NONE}
RequestStartShakeAwardMsg = checkUser;
when{}
function RequestStartShakeAwardMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:StartShakeAward();
end


--玩家获取奖励
define.RequestGetShakeAwardsMsg
{
	user = NONE,
};
when {user = NONE}
RequestGetShakeAwardsMsg = checkUser;
when{}
function RequestGetShakeAwardsMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:GetShakeAwards();
end
---玩家强制关闭摇奖界面获取奖励
define.CloseUiGetShakeAwardsMsg
{
	user = NONE,
};
when {user = NONE}
CloseUiGetShakeAwardsMsg = checkUser;
when{}
function CloseUiGetShakeAwardsMsg(user)
	local sys = user:GetSystem("COnlineAwardsSystem");
	if not sys then
		return;
	end;
	sys:CloseUiGetShakeAwards();
end
----获取收获奖励广播
define.BroadCastGetShakeAwardsMsg
{
	RoleID	= 0,
	RoleName= "",
	AwardInfo = {};
};
when{}
function BroadCastGetShakeAwardsMsg(RoleID,RoleName,AwardInfo)
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
		table.insert(setNet, objPlayer.objNet);
	end;
	_groupcallout(setNet, "CltBroadCastGetShakeAwardsMsg", {RoleID = RoleID,RoleName = RoleName,AwardInfo = AwardInfo});	
end

-----到时间清本日奖励列表
define.KSClearOnlineAwardsInfoMsg
{
};
when{}
function KSClearOnlineAwardsInfoMsg()
	for k,user in pairs(CPlayerManager.setAllPlayer) do
	    local sys = user:GetSystem("COnlineAwardsSystem");
		if not sys then
			return;
		end;
		sys:ClearOnlineAwardsInfo(); 
	end
end
