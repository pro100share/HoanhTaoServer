--[[
功能：公会系统消息处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-05-04
]]

_define()
----------------------------------------------------------------------------
--获取帮派信息列表
define.OnKSRequestGuildInfoListMsg
{
	RoleID = 0,
	Info = {},
}
when{}
function OnKSRequestGuildInfoListMsg(RoleID,Info)
	local tabInfo = CGuildManager:GetGuildInfoList(unpack(Info))
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	tabInfo = GuildParseList(tabInfo,GuildInfoListMsgStN)
	objPlayer.OnKSReceiveGuildInfoListMsg { Info = tabInfo }
end;
--获取帮派搜索列表
define.OnKSRequestGuildSearchListMsg
{
	RoleID = 0,
	Info = {},
}
when{}
function OnKSRequestGuildSearchListMsg(RoleID,Info)
	local tabInfo = CGuildManager:GetGuildSearchList(unpack(Info))
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	tabInfo = GuildParseList(tabInfo,GuildInfoListMsgStN)
	objPlayer.OnKSReceiveGuildSearchListMsg { Info = tabInfo }
end;
--获取帮派成员列表
define.OnKSRequestGuildMemberListMsg
{
	RoleID = 0,
	GuildID = 0,
}
when{}
function OnKSRequestGuildMemberListMsg(RoleID,GuildID)
	local tabInfo = CGuildManager:GetGuildMemberList(GuildID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	tabInfo = GuildParseList(tabInfo,GuildMemberListMsgStN)
	objPlayer.OnKSReceiveGuildMemberListMsg { Info = tabInfo }
end;
--获取帮派申请列表
define.OnKSRequestGuildApplyListMsg
{
	RoleID = 0,
	GuildID = 0,
}
when{}
function OnKSRequestGuildApplyListMsg(RoleID,GuildID)
	local tabInfo = CGuildManager:GetGuildApplyList(GuildID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	for i = 101,#tabInfo do tabInfo[i] = nil end
	tabInfo = GuildParseList(tabInfo,GuildApplyListMsgStN)
	objPlayer.OnKSReceiveGuildApplyListMsg { Info = tabInfo }
end;
define.OnKSRequestGuildDonateListMsg
{
	RoleID = 0,
	GuildID = 0,
}
when{}
function OnKSRequestGuildDonateListMsg(RoleID,GuildID)
	local tabInfo = CGuildManager:GetGuildDonateList(GuildID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	tabInfo = GuildParseList(tabInfo,GuildDonateListMsgStN)
	objPlayer.OnKSReceiveGuildDonateListMsg { Info = tabInfo }
end;
--获取帮派日志列表
define.OnKSRequestGuildLogListMsg
{
	RoleID = 0,
	GuildID = 0,
}
when{}
function OnKSRequestGuildLogListMsg(RoleID,GuildID)
	local tabInfo = CGuildManager:GetGuildLogList(GuildID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	tabInfo = GuildParseList(tabInfo,GuildLogListMsgStN)
	objPlayer.OnKSReceiveGuildLogListMsg { Info = tabInfo }
end;
----------------------------------------------------------------------------
--获取帮派查看信息
define.OnKSRequestGuildViewMsg
{
	SrcID = 0,
	TarID = 0,
	GuildID = 0,
}
when{}
function OnKSRequestGuildViewMsg(SrcID,TarID,GuildID)
	local objPlayer = CGameLineManager:GetPlayer(SrcID)
	if not objPlayer then return end
	local tabInfo = {}
	if GuildID ~= 0 then
		tabInfo = CGuildManager:GetGuildInfo(GuildID) or {}
	else
		local objMember = CGuildMemberMgr:Get(TarID)
		if objMember then
			local dwGuildID = objMember.dwGuildID
			tabInfo = CGuildManager:GetGuildInfo(dwGuildID) or {}
		end
	end
	tabInfo = GuildParseTable(tabInfo,GuildInfoMsgStN)
	objPlayer.OnKSReceiveGuildViewMsg {
		RoleID = TarID,GuildID = GuildID,Info = tabInfo
	}
end;
--获取帮派活跃信息
define.OnKSRequestGuildActiveMsg
{
	RoleID = 0,
}
when{}
function OnKSRequestGuildActiveMsg(RoleID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(RoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local tabInfo = CGuildManager:GetGuildInfo(dwGuildID)
	tabInfo = GuildParseTable(tabInfo,GuildActiveMsgStN)
	objPlayer.OnKSReceiveGuildActiveMsg { Info = tabInfo }
end;
--获取帮派资源信息
define.OnKSRequestGuildResourceMsg
{
	RoleID = 0,
}
when{}
function OnKSRequestGuildResourceMsg(RoleID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(RoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local tabInfo = CGuildManager:GetResourceInfo(dwGuildID)
	tabInfo = GuildParseTable(tabInfo,GuildResourceMsgStN)
	objPlayer.OnKSReceiveGuildResourceMsg { Info = tabInfo }
end;
--获取帮派押镖信息
define.OnKSRequestGuildEscortMsg
{
	RoleID = 0;
}
when{}
function OnKSRequestGuildEscortMsg(RoleID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(RoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local tabInfo = CGuildManager:GetEscortInfo(dwGuildID)
	objPlayer.OnKSReceiveGuildEscortMsg{ Info = tabInfo }
end
--获取帮派商店信息
define.OnKSRequestGuildMarketMsg
{
	RoleID = 0,
}
when{}
function OnKSRequestGuildMarketMsg(RoleID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	local objMember = CGuildMemberMgr:Get(RoleID)
	if not objMember then return end
	local dwGuildID = objMember.dwGuildID
	local tabInfo = CGuildManager:GetMarketInfo(dwGuildID)
	objPlayer.OnKSReceiveGuildMarketMsg { Info = tabInfo }
end;
--获取帮派龙鼎信息
define.OnKSRequestGuildTrophyMsg
{
	RoleID = 0,
}
when{}
function OnKSRequestGuildTrophyMsg(RoleID)
	local objPlayer = CGameLineManager:GetPlayer(RoleID)
	if not objPlayer then return end
	local tabInfo = CGuildManager:GetAllTrophyInfo()
	objPlayer.OnKSReceiveGuildTrophyMsg{ Info = tabInfo }
end;
----------------------------------------------------------------------------
--玩家消息通知
define.GuildPlayerMsg
{
	SrcID = 0,
	Cmd = '',
	Info = {},
}
when{}
function GuildPlayerMsg(SrcID,Cmd,Info)
	if CGuildPlayerMsg.private[Cmd] then
		return
	end
	local fn = CGuildPlayerMsg[Cmd]
	if fn and type(fn) == 'function'then
		CGuildPlayerMsg.dwSrcID = SrcID
		fn(CGuildPlayerMsg,unpack(Info))
		CGuildPlayerMsg.dwSrcID = nil
	end
end;
--服务器消息通知
define.GuildServerMsg
{
	Cmd = '',
	Info = {},
}
when{}
function GuildServerMsg(Cmd,Info)
	local fn = CGuildServerMsg[Cmd]
	if fn and type(fn) == 'function'then
		fn(CGuildServerMsg,unpack(Info))
	end
end;
----------------------------------------------------------------------------
--删除角色通知
define.KSGuildDeletePlayerMsg
{
	RoleID = 0,
}
when{}
function KSGuildDeletePlayerMsg(RoleID)
end;
----------------------------------------------------------------------------

