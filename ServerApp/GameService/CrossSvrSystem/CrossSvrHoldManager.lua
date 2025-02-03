_G.CCrossSvrHoldManager = CSingle:new();
CSingleManager:AddSingle(CCrossSvrHoldManager,true);

function CCrossSvrHoldManager:Create()
	self.CrossHoldInfo = {};
	self.HoldInfo = {};
	self:GetCrossHoldInfo()
	self.dwCrossExp = 1;
	if not _G.TestVersion then
		self:HotUpdate();
	else
		for dwCrossId, cfg in pairs(_G.CrossSvrConfig) do
			self:ClearHoldInfo(dwCrossId);
		end;
	end;
	return true;
end;

function CCrossSvrHoldManager:HotUpdate()
	for dwCrossId, cfg in pairs(_G.CrossSvrHotUpdateConfig) do
		local weekTbl = cfg.WeeklyOpenDay;
		for _, week in pairs(weekTbl) do
			--通知进场开始
			CAlarmClock:AddTask(
				{dwWeek = week - 1, dwTime = cfg.EnterTime},
				CAlarmTaskCycleType.eWeek, 1, 0,
				function() self:ClearHoldInfo(dwCrossId) end, {}
			);
		end;
	end;
end

function CCrossSvrHoldManager:GetCrossHoldInfo()
	CKernelApp.GetCrossHoldInfoMsg{};
end;

function CCrossSvrHoldManager:ClearHoldInfo(dwCrossId)
	CCrossSvrHoldManager:SetCrossExp(1)
	CKernelApp.ClearHoldInfoToKsMsg{CrossId = dwCrossId};
	local holdInfo = self:GetCrossHoldInfoOnEnterScene();
	for dwCrossId, info in pairs(holdInfo) do
		for dwRoleId, szRoleName in pairs(info) do
			local player = CPlayerManager:GetPlayerByRoleID(dwRoleId);
			if player then
				local buffSystem = player:GetSystem("CBuffSystem");	
				if buffSystem then	
					local corssSvrCfg = _G.CrossSvrConfig[dwCrossId];
					buffSystem:DeleteBuffByID(corssSvrCfg.BuffId);
					player:RmvViewModel(corssSvrCfg.ItemModelId);
					player:RmvViewPfx(corssSvrCfg.ItemPfxId)
				end;
			end;
		end;
	end;
end;
------------------------------------------------------------------------------------------------------------
--------------------------------------------------跨服战屠龙刀持有者-----------------------------------------
------------------------------------------------------------------------------------------------------------
function CCrossSvrHoldManager:SendHoldDataToKs(dwCrossId, dwHoldId, szHoldName, bOver)
	local corssSvrCfg = _G.CrossSvrConfig[dwCrossId];
	CCrossSvrHoldManager:SetCrossExp(corssSvrCfg.ExpParam)
	local player = CPlayerManager:GetPlayerByRoleID(dwHoldId);
	local flag = false;
	if player then
		flag = true;
		local buffSystem = player:GetSystem("CBuffSystem");	
		if buffSystem then		
			buffSystem:AddBuff(corssSvrCfg.BuffId, 1);
			player:AddViewModel(corssSvrCfg.ItemModelId);
			player:AddViewPfx(corssSvrCfg.ItemPfxId)
		end;
	end;
	CKernelApp.SendHoldDataToKsMsg{CrossId = dwCrossId, HoldId = dwHoldId, HoldName = szHoldName, OverFlag = bOver};
end;

function CCrossSvrHoldManager:SetCrossExp(num)
	self.dwCrossExp = num;
end;

function CCrossSvrHoldManager:GetCrossExp()
	return self.dwCrossExp;
end;

--解析杀怪信息
local function ParseStrToTbl(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local index, index1 = string.find(str1, ",");
		local str2 = string.sub(str1, 0, index -1);
		local str3 = string.sub(str1, index1 + 1, lastIndex - 1);
		local key = tonumber(str2);
		local value = str3;
		t[key] = value;	
	end;
	return t;
end;

--接受ks发过来屠龙刀持有信息
function CCrossSvrHoldManager:SetHoldInfo(dwCrossId, szHoldInfo, bOver)
	self.bOver = bOver;
	if not self.CrossHoldInfo[dwCrossId] then
		self.CrossHoldInfo[dwCrossId] = {};
	end;
	self.CrossHoldInfo[dwCrossId] = szHoldInfo;
	local holdInfo = ParseStrToTbl(szHoldInfo);
	if not self.HoldInfo[dwCrossId] then
		self.HoldInfo[dwCrossId] = {};
	end;
	self.HoldInfo[dwCrossId] = holdInfo;
	local setNet = {};
	for i,objPlayer in pairs(CPlayerManager.setAllPlayer) do	
		table.insert(setNet, objPlayer.objNet);
	end;
	if bOver then
		_groupcallout(setNet, "SendHoldInfoToClientMsg", {HoldInfo = self.HoldInfo, OverFlag = bOver, BroadFlag = bOver});	
	end;
end	;

function CCrossSvrHoldManager:InitHoldInfo(holdInfoTbl, bOver)
	if not self.CrossHoldInfo then return end;
	self.bOver = bOver;
	if not holdInfoTbl then
		return;
	end;
	local flag = false;
	for dwCrossId, szHoldInfo in pairs(holdInfoTbl) do
		if not self.CrossHoldInfo[dwCrossId] then
			self.CrossHoldInfo[dwCrossId] = {};
		end;
		self.CrossHoldInfo[dwCrossId] = szHoldInfo;
		local holdInfo = ParseStrToTbl(szHoldInfo);
		if not self.HoldInfo[dwCrossId] then
			self.HoldInfo[dwCrossId] = {};
		end;
		self.HoldInfo[dwCrossId] = holdInfo;
		if self.bOver then
			local corssSvrCfg = _G.CrossSvrConfig[dwCrossId];
			CCrossSvrHoldManager:SetCrossExp(corssSvrCfg.ExpParam);
			flag = true;
		end;
	end;
	if not flag then
		if self.bOver then
			CCrossSvrHoldManager:SetCrossExp(1);
		end;
	end;
end;

function CCrossSvrHoldManager:GetCrossHoldInfoOnEnterScene()
	return self.HoldInfo, self.bOver;
end;
