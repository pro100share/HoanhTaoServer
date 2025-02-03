--[[
	盟主系统 KS
	周长沙
--]]
--------------------------------------------------------------
--收到GS请求盟主信息
define.OnGSAskForAllianceLeaderMsg
{
	user = NONE,
}
when{user = NONE}
OnGSAskForAllianceLeaderMsg = checkGSUser;
when{}
function OnGSAskForAllianceLeaderMsg(user)
	CAllianceLeaderManager:SendSetInfo(user)
end;

--收到GS盟主战结束消息
define.OnGSAskForAllianceWarEndMsg
{
	user = NONE,
	RoleID = 0,
	MateRoleID = 0,
}
when{user = NONE}
OnGSAskForAllianceWarEndMsg = checkGSUser;
when{}
function OnGSAskForAllianceWarEndMsg(user,RoleID,MateRoleID)
	CAllianceLeaderManager:OnRecvWarEnd(RoleID,MateRoleID)
end;

--收到GS设置某个职位消息
define.OnGSAskForSetAllianceInfoMsg
{
	user = NONE,
	Type = 0,
	RoleName = "",
}
when{user = NONE}
OnGSAskForSetAllianceInfoMsg = checkGSUser;
when{}
function OnGSAskForSetAllianceInfoMsg(user,Type,RoleName)
	local dwRes,objPlayer = CAllianceLeaderManager:OnRecvSetInfo(Type,RoleName)
	user.AllianceLeaderSetResMsg{Res = dwRes}
	local dwType = 0
	if RoleName ~= "" then
		dwType = Type
	end
	if objPlayer then
		objPlayer.AllianceLeaderSetMsg{Name=user:GetInfo().szRoleName,Type=dwType}
	end
end;

local dwLastEnterGame = 0
--收到GS盟主上线消息
define.OnGSAllianceLeaderEnterGameMsg
{
}
when{}
function OnGSAllianceLeaderEnterGameMsg()
	if _now() - dwLastEnterGame > AllianceLeaderConfig.Delay.EnterGame then
		dwLastEnterGame = _now()
		CAllianceLeaderManager:OnRecvEnterGame()
	end
end;

--收到GS盟主称号信息
define.GSSendLeaderShowTextMsg
{
	RoleID = 0;
	Type = 0;
	Info = {};
}
when{}
function GSSendLeaderShowTextMsg(RoleID,Type,Info)
	CAllianceLeaderManager:OnRecvShowText(RoleID,Type,Info)
end

--收到GS 搜索请求
define.OnGSAskForLeaderSearchMsg
{
	Name = ""
}
when{}
function OnGSAskForLeaderSearchMsg(Name)
	CAllianceLeaderManager:OnRecvSearch(Name)
end
--收到GS 请求页
define.OnGSAskForLeaderGetPageMsg
{
	Index = 0
}
when{}
function OnGSAskForLeaderGetPageMsg(Index)
	CAllianceLeaderManager:OnRecvGetPage(Index)
end

































