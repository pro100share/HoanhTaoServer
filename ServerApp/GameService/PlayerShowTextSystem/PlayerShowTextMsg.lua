--------------------------------
--[[
服务器 角色头顶文字信息
消息处理
周长沙
2012-3-31
--]]
--------------------------------
_define()
--收到客户端请求更新消息
define.PlayerShowTextOnAskForInfoMsg
{
	user  = NONE ,
}
when{ user = NONE }
PlayerShowTextOnAskForInfoMsg = checkUser
when{}
function PlayerShowTextOnAskForInfoMsg(user)
	if not CConfig.bIsCrossSvr then
		local sysPlayerShowText = user:GetSystem("PlayerShowTextSystem");
		if not sysPlayerShowText then
			return 
		end
		sysPlayerShowText:SendAllTextInfo()
	end;
end

--收到KS请求某个玩家信息
define.PlayerShowTextOnKSAskForInfoMsg
{
	user = NONE;
	Type = 0;
	RoleID = 0;
}
when{}
function PlayerShowTextOnKSAskForInfoMsg(user,Type,RoleID)
	local f = function()
		local objPlayer = CMapManager:GetPlayer(RoleID)
		if not objPlayer then return end;
		local sysPlayerShowText = objPlayer:GetSystem("PlayerShowTextSystem");
		if not sysPlayerShowText then return end;
		local Info = {}
		Info.szLoverText 	= sysPlayerShowText.szLoverText
		Info.tbTitle 		= sysPlayerShowText.tbTitle
		Info.tbSp 			= sysPlayerShowText.tbSp
		CKernelApp.GSSendLeaderShowTextMsg{RoleID=RoleID;Type=Type;Info=Info};
	end
	CDelayerManager:Delay(eDelay._100ms,f)
end
