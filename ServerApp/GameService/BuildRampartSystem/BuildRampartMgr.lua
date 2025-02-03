--[[
功能：修城墙管理器，单体
作者：曲莹
时间：2013-04-26
]]
_G.CBuildRampartMgr = {}
CSingleManager:AddSingle(CBuildRampartMgr);

--创建修城墙管理器
function CBuildRampartMgr:Create()
	self.ContributeInfo = {}; --捐献最高者信息
	self.BuildPlan = 1;  --捐献阶段
	self.BuildPlanValue = 0; --捐献值
	self.BuildExp = 1; --众志成城经验系数
	self.PlanLapfulFlag = false;  --是否捐献已满
	self:GetBuildRampartInfo();
end;

--更新修城墙管理器
function CBuildRampartMgr:Update()
	return true;
end;

--释放修城墙管理器
function CBuildRampartMgr:Destroy()
	for i,sDupl in pairs(self.setAllDupl) do
		sDupl:Destroy();
	end;
end;

--获得修城墙进度
function CBuildRampartMgr:GetBuildRampartInfo()
	local lineId = CKernelApp.dwLineID;
	CKernelApp.GetBuildPlanKsMsg{ Line = CKernelApp.dwLineID }
end;

--请求更新修城墙记录
function CBuildRampartMgr:UpdateBuildPlan(value)
	CKernelApp.SendBuildToKsMsg{Line = CKernelApp.dwLineID, ChgValue = value}
end;

--ks同步到gs修城墙进度
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
--设置当前的捐献阶段
function CBuildRampartMgr:GetBuildPlan()
	return self.BuildPlan;
end;
--获得当前的捐献值
function CBuildRampartMgr:GetBuildPlanValue()
	return self.BuildPlanValue;
end;
--设置捐献最多的信息
function CBuildRampartMgr:SetContributeInfo(contributeInfo)
	self.ContributeInfo = contributeInfo;
end;

function CBuildRampartMgr:GetContributeInfo()
	return self.ContributeInfo;
end;
--设置捐献值是否已满
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
--设置众志成城影响的经验系数
function CBuildRampartMgr:SetBuildExp(value)
	self.BuildExp = value;
end;
function CBuildRampartMgr:GetBuildExp()
	return self.BuildExp;
end;

--请求更新珍珑棋局 --self.ContributeInfo[roleId] = {roleName, iconId, contributeValue};
function CBuildRampartMgr:UpdateContributeInfo(roleId, roleName, contributeValue, iconId)
	for dwRoleId, info in pairs(self:GetContributeInfo()) do
		if info[3] < contributeValue then
			CKernelApp.SendMaxConToKsMsg{Line = CKernelApp.dwLineID, RoleId = roleId, RoleName = roleName, ContributeValue = contributeValue, IconId = iconId};
		end;
	end;
end;
--更新捐献最高的信息并同步
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
--每天定时清除捐献次数和cd
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