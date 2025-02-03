--[[
功能：公会系统消息处理（服务器）
版本：v1.0
作者：郭肇义
时间：2012-05-04
]]

_define()

--获取帮派信息列表
define.OnRequestGuildInfoListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnRequestGuildInfoListMsg = checkUser;
when{}
function OnRequestGuildInfoListMsg(user,Info)
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildInfoListMsg{
		RoleID = dwRoleID,Info = Info
	}
end;
define.OnKSReceiveGuildInfoListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildInfoListMsg = checkKSUser;
when{}
function OnKSReceiveGuildInfoListMsg(user,Info)
	user.OnReceiveGuildInfoListMsg { Info = Info }
end;
--获取帮派搜索列表
define.OnRequestGuildSearchListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnRequestGuildSearchListMsg = checkUser;
when{}
function OnRequestGuildSearchListMsg(user,Info)
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildSearchListMsg{
		RoleID = dwRoleID,Info = Info
	}
end;
define.OnKSReceiveGuildSearchListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildSearchListMsg = checkKSUser;
when{}
function OnKSReceiveGuildSearchListMsg(user,Info)
	user.OnReceiveGuildSearchListMsg { Info = Info }
end;
----------------------------------------------------------------------------
--获取帮派成员列表
define.OnRequestGuildMemberListMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildMemberListMsg = checkUser;
when{}
function OnRequestGuildMemberListMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildMemberListMsg{
		RoleID = dwRoleID,GuildID = dwGuildID
	}
end;
define.OnKSReceiveGuildMemberListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildMemberListMsg = checkKSUser;
when{}
function OnKSReceiveGuildMemberListMsg(user,Info)
	local dwCount,tabTemp = 0,{}
	for k,v in ipairs(Info) do
		tabTemp[k] = v
		dwCount = dwCount + 1
		if dwCount >= 10 then
			user.OnReceiveGuildMemberListMsg { Info = tabTemp }
			dwCount,tabTemp = 0,{}
		end
	end
	if dwCount ~= 0 then
		user.OnReceiveGuildMemberListMsg { Info = tabTemp }
	end
	user.OnReceiveGuildMemberListMsg {}
end;
--获取帮派申请列表
define.OnRequestGuildApplyListMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildApplyListMsg = checkUser;
when{}
function OnRequestGuildApplyListMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildApplyListMsg{
		RoleID = dwRoleID,GuildID = dwGuildID
	}
end;
define.OnKSReceiveGuildApplyListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildApplyListMsg = checkKSUser;
when{}
function OnKSReceiveGuildApplyListMsg(user,Info)
	local dwCount,tabTemp = 0,{}
	for k,v in ipairs(Info) do
		tabTemp[k] = v
		dwCount = dwCount + 1
		if dwCount >= 10 then
			user.OnReceiveGuildApplyListMsg { Info = tabTemp }
			dwCount,tabTemp = 0,{}
		end
	end
	if dwCount ~= 0 then
		user.OnReceiveGuildApplyListMsg { Info = tabTemp }
	end
	user.OnReceiveGuildApplyListMsg {}
end;
--获取帮派捐献列表
define.OnRequestGuildDonateListMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildDonateListMsg = checkUser;
when{}
function OnRequestGuildDonateListMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildDonateListMsg{
		RoleID = dwRoleID,GuildID = dwGuildID
	}
end;
define.OnKSReceiveGuildDonateListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildDonateListMsg = checkKSUser;
when{}
function OnKSReceiveGuildDonateListMsg(user,Info)
	local dwCount,tabTemp = 0,{}
	for k,v in ipairs(Info) do
		tabTemp[k] = v
		dwCount = dwCount + 1
		if dwCount >= 10 then
			user.OnReceiveGuildDonateListMsg { Info = tabTemp }
			dwCount,tabTemp = 0,{}
		end
	end
	if dwCount ~= 0 then
		user.OnReceiveGuildDonateListMsg { Info = tabTemp }
	end
	user.OnReceiveGuildDonateListMsg {}
end;
--获取帮派日志列表
define.OnRequestGuildLogListMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildLogListMsg = checkUser;
when{}
function OnRequestGuildLogListMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildLogListMsg{
		RoleID = dwRoleID,GuildID = dwGuildID
	}
end;
define.OnKSReceiveGuildLogListMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildLogListMsg = checkKSUser;
when{}
function OnKSReceiveGuildLogListMsg(user,Info)
	local dwCount,tabTemp = 0,{}
	for k,v in ipairs(Info) do
		tabTemp[k] = v
		dwCount = dwCount + 1
		if dwCount >= 10 then
			user.OnReceiveGuildLogListMsg { Info = tabTemp }
			dwCount,tabTemp = 0,{}
		end
	end
	if dwCount ~= 0 then
		user.OnReceiveGuildLogListMsg { Info = tabTemp }
	end
	user.OnReceiveGuildLogListMsg {}
end;
----------------------------------------------------------------------------
--获取帮派查看信息
define.OnRequestGuildViewMsg
{
	user = NONE,
	RoleID = 0,
	GuildID = 0,
}
when{user = NONE}
OnRequestGuildViewMsg = checkUser;
when{}
function OnRequestGuildViewMsg(user,RoleID,GuildID)
	local dwSrcID = user:GetInfo().dwRoleID
	local dwTarID = RoleID
	CKernelApp.OnKSRequestGuildViewMsg{
		SrcID = dwSrcID,TarID = dwTarID,GuildID = GuildID
	}
end;
define.OnKSReceiveGuildViewMsg
{
	user = NONE,
	RoleID = 0,
	GuildID = 0,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildViewMsg = checkKSUser;
when{}
function OnKSReceiveGuildViewMsg(user,RoleID,GuildID,Info)
	user.OnReceiveGuildViewMsg {
		RoleID = RoleID,GuildID = GuildID,Info = Info
	}
end;
----------------------------------------------------------------------------
--获取帮派活跃信息
define.OnRequestGuildActiveMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildActiveMsg = checkUser;
when{}
function OnRequestGuildActiveMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildActiveMsg{ RoleID = dwRoleID }
end;
define.OnKSReceiveGuildActiveMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildActiveMsg = checkKSUser;
when{}
function OnKSReceiveGuildActiveMsg(user,Info)
	user.OnReceiveGuildActiveMsg { Info = Info }
end;
--获取帮派资源信息
define.OnRequestGuildResourceMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildResourceMsg = checkUser;
when{}
function OnRequestGuildResourceMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildResourceMsg{ RoleID = dwRoleID }
end;
define.OnKSReceiveGuildResourceMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildResourceMsg = checkKSUser;
when{}
function OnKSReceiveGuildResourceMsg(user,Info)
	user.OnReceiveGuildResourceMsg { Info = Info }
end;
--获取帮派押镖信息
define.OnRequestGuildEscortMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildEscortMsg = checkUser;
when{}
function OnRequestGuildEscortMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildEscortMsg{ RoleID = dwRoleID }
end;
define.OnKSReceiveGuildEscortMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildEscortMsg = checkKSUser;
when{}
function OnKSReceiveGuildEscortMsg(user,Info)
	local objSystem = user:GetSystem("CGuildSystem")
	user.OnReceiveGuildEscortMsg { Info = Info }
end;
--获取帮派商店信息
define.OnRequestGuildMarketMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildMarketMsg = checkUser;
when{}
function OnRequestGuildMarketMsg(user)
	local objSystem = user:GetSystem('CGuildSystem')
	local dwGuildID = objSystem:GetGuildID()
	if not dwGuildID then return end
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildMarketMsg{ RoleID = dwRoleID }
end;
define.OnKSReceiveGuildMarketMsg
{
	user = NONE,
	Info = {}
}
when{user = NONE}
OnKSReceiveGuildMarketMsg = checkKSUser;
when{}
function OnKSReceiveGuildMarketMsg(user,Info)
	user.OnReceiveGuildMarketMsg { Info = Info }
end;
--获取帮派龙鼎信息
define.OnRequestGuildTrophyMsg
{
	user = NONE,
}
when{user = NONE}
OnRequestGuildTrophyMsg = checkUser;
when{}
function OnRequestGuildTrophyMsg(user)
	local dwRoleID = user:GetInfo().dwRoleID
	CKernelApp.OnKSRequestGuildTrophyMsg{ RoleID = dwRoleID }
end
define.OnKSReceiveGuildTrophyMsg
{
	user = NONE;
	Info = {};
}
when{user = NONE}
OnKSReceiveGuildTrophyMsg = checkKSUser;
when{}
function OnKSReceiveGuildTrophyMsg(user,Info)
	user.OnReceiveGuildTrophyMsg{ Info = Info }
end
----------------------------------------------------------------------------
--玩家消息通知
define.GuildPlayerMsg
{
	user = NONE,
	Cmd = '',
	Info = {},
}
when{user = NONE}
GuildPlayerMsg = checkUser;
when{}
function GuildPlayerMsg(user,Cmd,Info)
--	print('###########################################')
--	print(Cmd,unpack(Info))
--	print('###########################################')
	if not CConfig.bIsCrossSvr then
		local objMsg = user:GetSystem('CGuildSystem'):Msg()
		if objMsg.Src[Cmd] then
			local fn = objMsg[Cmd]
			fn(objMsg,unpack(Info))
		else
			objMsg:NotifyKernel(Cmd,unpack(Info))
		end
	end;
end;
--玩家消息响应
define.OnGuildPlayerMsg
{
	Target = {},
	Cmd = '',
	Info = {},
}
when{}
function OnGuildPlayerMsg(Target,Cmd,Info)
--	print('###########################################')
--	print(unpack(Target))
--	print(Cmd,unpack(Info))
--	print('###########################################')

	local tabPlayerList = {}
	if pairs(Target)(Target) then
		for k in pairs(Target) do
			local objPlayer = CMapManager:GetPlayer(k)
			if objPlayer then
				table.insert(tabPlayerList,objPlayer)
			end
		end
	else
		tabPlayerList = CMapManager:GetPlayer()
	end
	if CGuildPlayerMsg.Des[Cmd] then
		for _,objPlayer in pairs(tabPlayerList) do
			local objMsg = objPlayer:GetSystem('CGuildSystem'):Msg()
			objMsg[Cmd](objMsg,unpack(Info))
		end
	else
		local tabNetList = {}
		for _,objPlayer in pairs(tabPlayerList) do
			table.insert(tabNetList,objPlayer.objNet)
		end
		local tabParam = { Cmd = Cmd,Info = Info }
		_groupcallout(tabNetList,'GuildPlayerMsg',tabParam)
	end	
end;
--服务器消息响应
define.OnGuildServerMsg
{
	Cmd = '',
	Info = {},
}
when{}
function OnGuildServerMsg(Cmd,Info)
--	print('###########################################')
--	print(Cmd,unpack(Info))
--	print('###########################################')
	if CGuildServerMsg[Cmd] then
		local fn = CGuildServerMsg[Cmd]
		fn(CGuildServerMsg,unpack(Info))
	end
end;
----------------------------------------------------------------------------
