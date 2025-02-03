define.GetBuildPlanKsMsg
{
	Line = 0,
}
when{}

function GetBuildPlanKsMsg(Line)
	local objLine = CGameLineManager:GetLine(Line)
	local buildPlan, buildPlanValue, planLapful = CBuildMgr:GetBuildPlanInfo();
	local maxContributeInfo = CBuildMgr:GetContributeInfo()
	objLine.OnKSInitBuildMsg{BuildPlan = buildPlan, BuildPlanValue = buildPlanValue, ContributeInfo = maxContributeInfo, PlanLapFul = planLapful};
end;

--gs通知ks修城墙进度变化
define.SendBuildToKsMsg
{
	Line = 0,
	ChgValue = 0,
}
when{}

function SendBuildToKsMsg(Line, ChgValue)
	CBuildMgr:SetBuildPlan(ChgValue)
end;

--更新最高捐献具体
define.SendMaxConToKsMsg
{
	Line = 0,
	RoleId =0,
	RoleName = "",
	ContributeValue = 0,
	IconId = 0,
}
when{}

function SendMaxConToKsMsg(Line, RoleId, RoleName, ContributeValue, IconId)
	CBuildMgr:ChgMaxContribute(RoleId, RoleName, ContributeValue, IconId)
end;