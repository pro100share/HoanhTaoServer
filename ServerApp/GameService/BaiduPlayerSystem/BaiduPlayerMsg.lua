--[[
功能：百度影音推广 消息（服务器）
作者：周长沙
时间：2013-9-9
]]
_define()
------------------------------------------------------
--收到领取安装奖励需求
define.BaiduPlayerGetOnceMsg
{
	user = NONE;
}
when{ user = NONE }
BaiduPlayerGetOnceMsg = checkUser
when{}
function BaiduPlayerGetOnceMsg(user)
	local sys = user:GetSystem("CBaiduPlayerSystem");
	if not sys then return end;
	sys:OnRecvAskForOnceReward()
end

--收到领取每日奖励需求
define.BaiduPlayerGetDailyMsg
{
	user = NONE;
}
when{ user = NONE }
BaiduPlayerGetDailyMsg = checkUser
when{}
function BaiduPlayerGetDailyMsg(user)
	local sys = user:GetSystem("CBaiduPlayerSystem");
	if not sys then return end;
	sys:OnRecvAskForDailyReward()
end
--------------------------------------------------------------











