--[[
功能：摇骰子系统（服务器）
作者：周长沙
时间：2013-1-17
]]
------------------------------------------------------
--收到玩家请求获取摇骰子信息
define.GambleGetInfoMsg
{
	user = NONE;
}
when{ user = NONE }
GambleGetInfoMsg = checkUser
when{}
function GambleGetInfoMsg(user)
	local sysGamble = user:GetSystem("CGambleSystem");
	sysGamble:OnRcevGetInfoMsg()
end

--收到开始信息
define.GambleStartMsg
{
	user = NONE;
}
when{ user = NONE }
GambleStartMsg = checkUser
when{}
function GambleStartMsg(user)
	local sysGamble = user:GetSystem("CGambleSystem");
	sysGamble:OnRcevStartMsg()
end
--收到领取信息
define.GambleRewardMsg
{
	user = NONE;
}
when{ user = NONE }
GambleRewardMsg = checkUser
when{}
function GambleRewardMsg(user)
	local sysGamble = user:GetSystem("CGambleSystem");
	sysGamble:OnRcevRewardMsg()
end
--收到踢桌子信息
define.GambleFreeChangeMsg
{
	user = NONE;
}
when{ user = NONE }
GambleFreeChangeMsg = checkUser
when{}
function GambleFreeChangeMsg(user)
	local sysGamble = user:GetSystem("CGambleSystem");
	sysGamble:OnRcevFreeChangeMsg()
end
--收到逆天改运信息
define.GambleChangeMsg
{
	user = NONE;
}
when{ user = NONE }
GambleChangeMsg = checkUser
when{}
function GambleChangeMsg(user)
	if not CConfig.bIsCrossSvr then
		local sysGamble = user:GetSystem("CGambleSystem");
		sysGamble:OnRcevChangeMsg()
	end;
end






