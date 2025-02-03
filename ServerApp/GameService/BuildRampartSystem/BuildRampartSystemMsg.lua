--ksͬ���޳�ǽ����
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

--UpdateFlagΪtrue��ʾͬ����ǰ���ȵ�״̬Ϊ����ȡ
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
----�㲥
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
--ɾ�����׾��齱��
define.ClearContriExpMsg
{
}
when{}
function ClearContriExpMsg()
	CBuildRampartMgr:SetBuildExp(1)
end;

--������ݿ���״�������Ϣ
define.UpdateContriNumMsg
{

}
when{}
function UpdateContriNumMsg()
	CBuildRampartMgr:UpdateContriNum()
end;
--ͬ��Record��Ϣ
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
--��ÿͻ�����ʾ��Ϣ
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

--��ý���������
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
--��õ�ǰ�Ĺ���ֵ
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
--�ͻ����������������
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
--����Ԫ�����cd
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


