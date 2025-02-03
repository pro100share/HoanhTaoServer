--[[
	盟主系统 GS
	周长沙
--]]
--------------------------------------------------------------
--收到KS的职位更新消息
define.AllianceLeaderUpdateMsg
{
	Info = {}
}
when{}
function AllianceLeaderUpdateMsg(Info)
	CAllianceLeaderManager:OnRecvLeaderUpdate(Info)
end;

--收到KS设置结果消息
define.AllianceLeaderSetResMsg
{
	user = NONE,
	Res = 0
}
when{user = NONE}
AllianceLeaderSetResMsg = checkKSUser;
when{}
function AllianceLeaderSetResMsg(user,Res)
	local sys = user:GetSystem("CAllianceLeaderSystem")
	if not sys then return end;
	sys:OnRecvLeaderSetRes(Res)
end;

--收到KS职位设置消息
define.AllianceLeaderSetMsg
{
	user = NONE,
	Name = "",
	Type = 0
}
when{user = NONE}
AllianceLeaderSetMsg = checkKSUser;
when{}
function AllianceLeaderSetMsg(user,Name,Type)
	local sys = user:GetSystem("CAllianceLeaderSystem")
	if not sys then return end;
	sys:OnRecvLeaderSet(Name,Type)
end;

--收到盟主上线消息
define.AllianceLeaderOnRecvEnterGameMsg
{
	Name = ""
}
when{}
function AllianceLeaderOnRecvEnterGameMsg(Name)
	for k,v in pairs(CMapManager:GetPlayer()) do
		v.OnAllianceLeaderEnterGameMsg{Name=Name}
	end
end;

--收到称号信息
define.AllianceLeaderShowTextMsg
{
	RoleID = 0;
	Type = 0;
	Info = {};
}
when{}
function AllianceLeaderShowTextMsg(RoleID,Type,Info)
	CAllianceLeaderManager:OnRecvLeaderShowText(Type,Info)
end

--收到KS返回搜索页
define.AllianceLeaderGetPageMsg
{
	user = NONE,
	Page = {};
}
when{user = NONE}
AllianceLeaderGetPageMsg = checkKSUser;
when{}
function AllianceLeaderGetPageMsg(user,Page)
	user.OnAllianceLeaderSearchPageMsg{Page=Page}
end
---------------------------------------------------------------------
--收到Clt请求盟主信息
define.OnCltAskForAllianceLeaderMsg
{
	user = NONE,
}
when{user = NONE}
OnCltAskForAllianceLeaderMsg = checkUser;
when{}
function OnCltAskForAllianceLeaderMsg(user)
	local sys = user:GetSystem("CAllianceLeaderSystem")
	if not sys then return end;
	sys:OnAskForAllianceLeader()
end;

--收到Clt 任命消息
define.OnCltSetLeaderMsg
{
	user = NONE,
	Name = "",
	Type = 0,
}
when{user = NONE}
OnCltSetLeaderMsg = checkUser;
when{}
function OnCltSetLeaderMsg(user,Name,Type)
	local sys = user:GetSystem("CAllianceLeaderSystem")
	if not sys then return end;
	local dwRes = sys:OnRecvCltSetLeader(Type,Name)
	if dwRes~=0 then
		sys:SendLeaderSetRes(dwRes)
	end
end;

--收到Clt 搜索消息
define.OnCltLeaderSearchMsg
{
	user = NONE,
	Name = "",
}
when{user = NONE}
OnCltLeaderSearchMsg = checkUser;
when{}
function OnCltLeaderSearchMsg(user,Name)
	--print("SSSSSSSSSSSSS",Name)
	CKernelApp.OnGSAskForLeaderSearchMsg{Name=Name};
end;

--收到Clt 请求某页
define.OnCltLeaderGetPageMsg
{
	user = NONE,
	Index = 0,
}
when{user = NONE}
OnCltLeaderGetPageMsg = checkUser;
when{}
function OnCltLeaderGetPageMsg(user,Index)
	CKernelApp.OnGSAskForLeaderGetPageMsg{Index=Index};
end;


























