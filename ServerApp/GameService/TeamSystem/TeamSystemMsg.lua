--[[
--组队系统消息传输
--曲莹
--2012-03-05
]]--
define.ServerInviteTeamMsg{
	user = NONE,
	RoleId = 0,
	JoinTeamId = 0,
};
when{user = NONE}
ServerInviteTeamMsg = checkUser;
when{}

function ServerInviteTeamMsg(user, RoleId, JoinTeamId)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:TeamInviteMsg(RoleId, JoinTeamId);
end;

define.ServerApplyTeamMsg{
	user = NONE,
	RoleId = 0,
	JoinTeamId = 0,
};
when{user = NONE}
ServerApplyTeamMsg = checkUser;
when{}

function ServerApplyTeamMsg(user, RoleId, JoinTeamId)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:TeamApplyMsg(RoleId, JoinTeamId);
end;

define.TeamRequestPanelMsg{
	user = NONE,
	RoleId = 0,
};
when{user = NONE}
TeamRequestPanelMsg = checkUser;
when{}

function TeamRequestPanelMsg(user, RoleId)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:RequestShowPanel(RoleId);
end;

--获得当前地图玩家小队信息
define.GetCurMapTeamInfoMsg{
	user = NONE,
};
when{user = NONE}
GetCurMapTeamInfoMsg = checkUser;
when{}

function GetCurMapTeamInfoMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:GetCurMapTeamInfo();
end;

--获得NearBy玩家信息
define.GetNearByPlayerInfoMsg{
	user = NONE,
};
when{user = NONE}
GetNearByPlayerInfoMsg = checkUser;
when{}

function GetNearByPlayerInfoMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:GetNearByPlayerInfo();
end;

--通过条件获得NearBy玩家信息
define.GetNearByPlayerByCondMsg{
	user = NONE,
	Condition = "",
};
when{user = NONE}
GetNearByPlayerByCondMsg = checkUser;
when{}

function GetNearByPlayerByCondMsg(user, Condition)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:GetNearByPlayerByCond(Condition);
end;

--修改队伍宣言
define.ModifyTeamEnounceMsg{
	user = NONE,
	TeamEnounce = "",
};
when{user = NONE}
ModifyTeamEnounceMsg = checkUser;
when{}

function ModifyTeamEnounceMsg(user, TeamEnounce)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	teamSystem:ModifyTeamEnounce(TeamEnounce);
end;

-----------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------我的队伍界面相关的msg----------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------

--主动离开队伍
define.InitiativeLeaveTeamMsg{
	user = NONE,
}
when{user = NONE}
InitiativeLeaveTeamMsg = checkUser;
when{}

function InitiativeLeaveTeamMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--更改自动申请状态
	teamSystem:ExitTeam();
end;

--更换队长
define.SpecifyCaptainMsg{
	user = NONE,
	Pos = 0,
}
when{user = NONE}
SpecifyCaptainMsg = checkUser;
when{}

function SpecifyCaptainMsg(user, Pos)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--更改自动申请状态
	teamSystem:SpecifyCaptain(Pos);
end;

--创建队伍
define.CreateTeamMsg{
	user = NONE,
}
when{user = NONE}
CreateTeamMsg = checkUser;
when{}

function CreateTeamMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--创建队伍
	teamSystem:CreateTeam();
end;

--请离队员
define.KickOutTeamMsg{
	user = NONE,
	RoleId = 0,
	Flag = true,
}
when{user = NONE}
KickOutTeamMsg = checkUser;
when{}

function KickOutTeamMsg(user, RoleId, Flag)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--请离队伍
	teamSystem:KickOutTeam(RoleId, Flag);
end;

-------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------附近队伍面板相关-----------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------

--获得附近小队信息(同一地图)
define.GetNearByTeamInfoMsg{
	user = NONE,
}
when{user = NONE}
GetNearByTeamInfoMsg = checkUser;
when{}

function GetNearByTeamInfoMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--请离队伍
	teamSystem:GetCurMapTeamInfo();
end;

--拒绝 请求
define.RefuseRequestMsg{
	user = NONE,
	RoleId = 0,
}
when{user = NONE}
RefuseRequestMsg = checkUser;
when{}

function RefuseRequestMsg(user, RoleId)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--请离队伍
	teamSystem:RefuseRequestMsg(RoleId);
end;
--进入副本()队友确认
define.ConfirmEnterFbMsg{
	user = NONE,
	DwDuplId = 0,
}
when{user = NONE}
ConfirmEnterFbMsg = checkUser;
when{}

function ConfirmEnterFbMsg(user, DwDuplId)
	local cduplSystem = user:GetSystem("CDuplSystem");
	if not cduplSystem then
		return;
	end;
	--进入副本场景
	cduplSystem:EnterDuplFb(DwDuplId);
end;

--进入副本()队友确认
define.LeaveFbSceneMsg{
	user = NONE,
	LeaveFlag = false,
	DuplId = 0,
}
when{user = NONE}
LeaveFbSceneMsg = checkUser;
when{}

function LeaveFbSceneMsg(user, LeaveFlag, DuplId)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--离开副本
	teamSystem:LeavelFbScene(LeaveFlag, DuplId);
end;

--客户端申请自动组队
define.ApplyAutoJoinTeamMsg{
	user = NONE,
}
when{user = NONE}
ApplyAutoJoinTeamMsg = checkUser;
when{}

function ApplyAutoJoinTeamMsg(user)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--离开副本
	teamSystem:GetTeamInfoInWar();
end;

--设置申请
define.SendApplyFlagMsg{
	user = NONE,
	ApplyFlag = false,
}
when{user = NONE}
SendApplyFlagMsg = checkUser;
when{}

function SendApplyFlagMsg(user, ApplyFlag)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--离开副本
	teamSystem:SetApplyFlag(ApplyFlag);
end;

--设置邀请
define.SendInviteFlagMsg{
	user = NONE,
	InviteFlag = false,
}
when{user = NONE}
SendInviteFlagMsg = checkUser;
when{}

function SendInviteFlagMsg(user, InviteFlag)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--离开副本
	teamSystem:SetInviteFlag(InviteFlag);
end;

define.SendTeamModeChgMsg{
	user = NONE,
	TeamMode = false,
}
when{user = NONE}
SendTeamModeChgMsg = checkUser;
when{}
function SendTeamModeChgMsg(user, TeamMode)
	local teamSystem = user:GetSystem("CTeamSystem");
	if not teamSystem then
		return;
	end;
	--改变组队模式
	teamSystem:SendTeamMode(TeamMode);
end;



