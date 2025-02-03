--ks同步修城墙进度
define.ChgBuildPlanMsg
{
	Plan = 0,
	PlanValue = 0, 
	UpdateFlag = false,
	PlanLapFul = false,
}
when{}
function ChgBuildPlanMsg(Plan, PlanValue, UpdateFlag, PlanLapFul)
	CBuildRampartMgr:SetBuildInfo(Plan, PlanValue, UpdateFlag);
	CBuildRampartMgr:SetPlanFulFlag(PlanLapFul);
end;

--UpdateFlag为true表示同步当前进度的状态为可领取
define.OnKSInitBuildMsg
{
	BuildPlan = 0,	
	BuildPlanValue = 0,
	ContributeInfo = {},
	ContributeInfo = {},
	PlanLapFul = false,
}
when{}
function OnKSInitBuildMsg(BuildPlan, BuildPlanValue, ContributeInfo, PlanLapFul)
	CBuildRampartMgr:SetBuildInfo(BuildPlan, BuildPlanValue);
	CBuildRampartMgr:SetContributeInfo(ContributeInfo);
	CBuildRampartMgr:SetPlanFulFlag(PlanLapFul);
end;
----广播
define.BRSys_BroadCastMsg
{
	CurPer = 0;
}
when{}
function BRSys_BroadCastMsg(CurPer)
	if CurPer == 5 then
		CBuildRampartMgr:SetBuildExp(5);
	end;
    local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do	
		if objPlayer:GetSystem("CBuildRampartSystem") then
			if objPlayer:GetSystem("CBuildRampartSystem"):HasAuthority("ChengQiang", false) then	
				table.insert(setNet, objPlayer.objNet);
			end;
		end;
	end; 
    _groupcallout(setNet, "BRSys_BroadCastMsg", {CurPer = CurPer});
end;
--删除捐献经验奖励
define.ClearContriExpMsg
{
}
when{}
function ClearContriExpMsg()
	CBuildRampartMgr:SetBuildExp(1)
end;

--清除数据库捐献次数等信息
define.UpdateContriNumMsg
{

}
when{}
function UpdateContriNumMsg()
	CBuildRampartMgr:UpdateContriNum()
end;
--同步Record信息
define.ChgMaxContributeMsg
{
	RoleId = 0,
	ContributeValue = 0, 
	RoleName = "",
	IconId = 0,
	UpdateFlag = false,
}
when{}
function ChgMaxContributeMsg(RoleId, ContributeValue, RoleName, IconId, UpdateFlag)
	CBuildRampartMgr:ChgContributeRecord(RoleId, ContributeValue, RoleName, IconId, UpdateFlag)
end;
--获得客户端显示信息
define.GetBuildShowMsg{
	user = NONE,
}
when{user = NONE}
GetBuildShowMsg = checkUser;
when{}

function GetBuildShowMsg(user)
	local buildSystem = user:GetSystem("CBuildRampartSystem");
	if not buildSystem then
		return;
	end;
	buildSystem:GetBuildInfo();
end;

--获得奖励掉落组
define.GetAwardInfoMsg{
	user = NONE,
	CurPlan = 1,
}
when{user = NONE}
GetAwardInfoMsg = checkUser;
when{}
function GetAwardInfoMsg(user, CurPlan)
	local buildSystem = user:GetSystem("CBuildRampartSystem");
	if not buildSystem then
		return;
	end;
	buildSystem:GetAwardDropItem(CurPlan);
end;
--获得当前的贡献值
define.GetCurConDataMsg{
	user = NONE,
}
when{user = NONE}
GetCurConDataMsg = checkUser;
when{}
function GetCurConDataMsg(user)
	local buildSystem = user:GetSystem("CBuildRampartSystem");
	if not buildSystem then
		return;
	end;
	buildSystem:GetCurConData();
end;
--客户端向服务端请求捐献
define.ReqContributeMsg{
	user = NONE,
	ContriType = 1,
}
when{user = NONE}
ReqContributeMsg = checkUser;
when{}
function ReqContributeMsg(user, ContriType)
	local buildSystem = user:GetSystem("CBuildRampartSystem");
	if not buildSystem then
		return;
	end;
	buildSystem:ReqContribute(ContriType);
end;
--花费元宝清除cd
define.CostYBClearCDMsg{
	user = NONE,
	CDType = 1,
	CDValue = 0,
}
when{user = NONE}
CostYBClearCDMsg = checkUser;
when{}
function CostYBClearCDMsg(user, CDType, CDValue)
	local buildSystem = user:GetSystem("CBuildRampartSystem");
	if not buildSystem then
		return;
	end;
	buildSystem:ClearCD(CDType, CDValue);
end;


