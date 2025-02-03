--[[
���ܣ��޳�ǽ������������
���ߣ���Ө
ʱ�䣺2013-04-26
]]
_G.CBuildRampartMgr = {}
CSingleManager:AddSingle(CBuildRampartMgr);

--�����޳�ǽ������
function CBuildRampartMgr:Create()
	self.ContributeInfo = {}; --�����������Ϣ
	self.BuildPlan = 1;  --���׽׶�
	self.BuildPlanValue = 0; --����ֵ
	self.BuildExp = 1; --��־�ɳǾ���ϵ��
	self.PlanLapfulFlag = false;  --�Ƿ��������
	self:GetBuildRampartInfo();
end;

--�����޳�ǽ������
function CBuildRampartMgr:Update()
	return true;
end;

--�ͷ��޳�ǽ������
function CBuildRampartMgr:Destroy()
	for i,sDupl in pairs(self.setAllDupl) do
		sDupl:Destroy();
	end;
end;

--����޳�ǽ����
function CBuildRampartMgr:GetBuildRampartInfo()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetBuildPlanKsMsg{ Line = CKernelApp.dwLineID }
end;

--��������޳�ǽ��¼
function CBuildRampartMgr:UpdateBuildPlan(value)
	CKernelApp.SendBuildToKsMsg{Line = CKernelApp.dwLineID, ChgValue = value}
end;

--ksͬ����gs�޳�ǽ����
function CBuildRampartMgr:SetBuildInfo(buildPlan, buildPlanValue, updateFlag)
	self.BuildPlanValue = buildPlanValue;
	self.BuildPlan = buildPlan;
	if updateFlag then
		local onlinePlayerTbl = CPlayerManager.setAllPlayer;
		local setNet = {}; 
		for id, player in pairs(onlinePlayerTbl) do
			if player and player:GetSystem("CBuildRampartSystem") then
				player:GetSystem("CBuildRampartSystem"):SetBuildAwardState(buildPlan, updateFlag)
				if player:GetSystem("CBuildRampartSystem"):HasAuthority("ChengQiang") then
					table.insert(setNet, player.objNet);
				end;
			end;
		end;
		_groupcallout(setNet, "SendBuildAwardStateMsg", {CurBuildPlan = self.BuildPlan, CurBuildValue = buildPlanValue, UpdateFlag =  updateFlag});	
	end;
end;
--���õ�ǰ�ľ��׽׶�
function CBuildRampartMgr:GetBuildPlan()
	return self.BuildPlan;
end;
--��õ�ǰ�ľ���ֵ
function CBuildRampartMgr:GetBuildPlanValue()
	return self.BuildPlanValue;
end;
--���þ���������Ϣ
function CBuildRampartMgr:SetContributeInfo(contributeInfo)
	self.ContributeInfo = contributeInfo;
end;

function CBuildRampartMgr:GetContributeInfo()
	return self.ContributeInfo;
end;
--���þ���ֵ�Ƿ�����
function CBuildRampartMgr:SetPlanFulFlag(flag)
	self.PlanLapfulFlag = flag;
	local onlinePlayerTbl = CPlayerManager.setAllPlayer;
	if self.PlanLapfulFlag then
		self:SetBuildExp(5);
	else
		self:SetBuildExp(1);
	end;
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CBuildRampartSystem") then
			--if player:GetSystem("CBuildRampartSystem"):HasAuthority("ChengQiang") then
				table.insert(setNet, player.objNet);
			--end;
		end;
	end;
	_groupcallout(setNet, "SendPlanFulMsg", {PlanLapFulFlag = self.PlanLapfulFlag});	
end;
function CBuildRampartMgr:GetPlanFulFlag()
	return self.PlanLapfulFlag;
end;
--������־�ɳ�Ӱ��ľ���ϵ��
function CBuildRampartMgr:SetBuildExp(value)
	self.BuildExp = value;
end;
function CBuildRampartMgr:GetBuildExp()
	return self.BuildExp;
end;

--�������������� --self.ContributeInfo[roleId] = {roleName, iconId, contributeValue};
function CBuildRampartMgr:UpdateContributeInfo(roleId, roleName, contributeValue, iconId)
	for dwRoleId, info in pairs(self:GetContributeInfo()) do
		if info[3] < contributeValue then
			CKernelApp.SendMaxConToKsMsg{Line = CKernelApp.dwLineID, RoleId = roleId, RoleName = roleName, ContributeValue = contributeValue, IconId = iconId};
		end;
	end;
end;
--���¾�����ߵ���Ϣ��ͬ��
function CBuildRampartMgr:ChgContributeRecord(roleId, contributeValue, roleName, iconId, updateFlag)
	self.ContributeInfo = {};
	self.ContributeInfo[roleId] = {roleName, iconId, contributeValue};
	if updateFlag then
		self.BuildPlan = 0;
		self.BuildPlanValue = 0;
		local setNet = {};
		for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do
			if objPlayer and objPlayer:GetSystem("CBuildRampartSystem") then
				objPlayer:GetSystem("CBuildRampartSystem"):ClearDataOnTime()
				if objPlayer:GetSystem("CBuildRampartSystem"):HasAuthority("ChengQiang") then
					table.insert(setNet, objPlayer.objNet);
				end;
			end;
		end;
		self.PlanLapfulFlag = false;
		_groupcallout(setNet, "NoticeClientContriClearMsg", {});
	end;
end;
--ÿ�춨ʱ������״�����cd
function CBuildRampartMgr:UpdateContriNum()
	local onlinePlayerTbl = CPlayerManager.setAllPlayer
	local setNet = {}; 
	for id, player in pairs(onlinePlayerTbl) do
		if player and player:GetSystem("CBuildRampartSystem") then
			player:GetSystem("CBuildRampartSystem"):ClearContriNum();
			if player:GetSystem("CBuildRampartSystem"):HasAuthority("ChengQiang") then
				table.insert(setNet, player.objNet);
			end;
		end;
	end;
	_groupcallout(setNet, "NoticeClearContriNumMsg", {});	
end;