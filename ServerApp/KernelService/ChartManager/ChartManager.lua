--[[
功能：排行榜管理器类（服务器）
版本：v1.0
作者：郭肇义
时间：2012-04-05
]]

_G.CChartManager = CSingle:new();
CSingleManager:AddSingle(CChartManager);
-----------------------------------------------------------------------------------------------
function CChartManager:Create()
	self.tabChartList = {} -- type->number->data
	self.tabChartTemp = {} -- type->number->data
	self.tabChartData = {} -- type->role->data
	self.tabChartRole = {} -- role->type->data
	self.tabChartHead = {} -- type->number->data
	
	local objDB = CPlayerDBQuery:GetDBQuery()
	self.objDB = CChartManagerDB:Create(objDB)
	
	local tabList = self.objDB:GetChartList()
	self.tabChartList = self:ParseChartList(tabList)
	self.tabChartRole = self:ParseChartRole(self.tabChartList)
	self.tabChartHead = self:ParseChartHead(self.tabChartList)
	
	local tabData = self.objDB:GetChartData()
	self.tabChartData = self:ParseChartData(tabData)

    for k, v in pairs(_G.ChartSwitch) do
        CAlarmClock:AddTask(
            _G.ChartAlarmClock[v].Time, _G.ChartAlarmClock[v].CycleType, 1, 0,
            function() 
                self:UpdateChart(v); 
            end,
            {}
        );
    end
    CAlarmClock:AddTask(
        {dwTime = _G.CharRefreshTime}, _G.CAlarmTaskCycleType.eDay, 1, 0,
        function()
            self:UpdateChart();
        end,
        {}
    );

	return true;
end;

function CChartManager:Update(dwInterval)
	return true;
end;

function CChartManager:Destroy()
end;
-----------------------------------------------------------------------------------------------
--接口
-----------------------------------------------------------------------------------------------
--获取排行榜列表
function CChartManager:GetChartList(eType,dwBegin,dwEnd)
	dwBegin = dwBegin or 1
	dwEnd = dwEnd or 100
	local tabRes = {}
	for i = dwBegin,dwEnd do
		local tabData = self.tabChartList[eType][i]
		if tabData then table.insert(tabRes,tabData) end
	end
	return tabRes 
end
--获取排行榜人物
function CChartManager:GetChartRole(dwRoleID)
	return self.tabChartRole[dwRoleID]
end
--获取排行榜头像
function CChartManager:GetChartHead(eType)
	return self.tabChartHead[eType]
end
--解析排行榜列表
function CChartManager:ParseChartList(tabPrarm)
	local tabChartList = {}
	for _,eType in pairs(ChartSwitch) do
		tabChartList[eType] = {}
	end
	for _,tabData in pairs(tabPrarm) do
		local tabSub = tabChartList[tabData.eType]
		if (not tabSub) or (tabData.dwNumber > 100) then
			self.objDB:DelChartList(tabData.eType,tabData.dwNumber)
		else
			tabSub[tabData.dwNumber] = tabData
		end
	end
	for eType,tabSub in pairs(tabChartList) do
		for i = 1,100 do
			if tabSub[i] then
				if tabSub[i].dwRoleID == 0 then
					tabSub[i] = nil
				end
			else
				self.objDB:AddChartList(eType,i)
			end
		end
	end
	return tabChartList
end
--解析排行榜数据
function CChartManager:ParseChartData(tabPrarm)
	local tabChartData = {}
	for _,eType in pairs(ChartSwitch) do
		tabChartData[eType] = {}
	end
	for _,tabData in pairs(tabPrarm) do
		local tabSub = tabChartData[tabData.eType]
		if tabSub then
			tabSub[tabData.dwRoleID] = tabData
		end
	end
	return tabChartData
end
--解析排行榜人物
function CChartManager:ParseChartRole(tabPrarm)
	local tabChartRole = {}
	for eType,tabSub in pairs(tabPrarm) do
		for dwNumber,tabData in pairs(tabSub) do
			local tabTemp = tabChartRole[tabData.dwRoleID]
			tabTemp = tabTemp or {}
			tabTemp[eType] = tabData
			tabChartRole[tabData.dwRoleID] = tabTemp
		end
	end
	return tabChartRole
end
--解析排行榜头像
function CChartManager:ParseChartHead(tabPrarm)
	local tabChartHead = {}
	for eType,tabSub in pairs(tabPrarm) do
		tabChartHead[eType] = {}
		for i = 1,5 do
			local tabData = tabSub[i]
			if not tabData then break end
			local dwRoleID = tabData.dwRoleID
			local tabInfo = COfflineInfoManager:GetRoleInfo(dwRoleID)
			tabInfo = tabInfo or {}
			local tabTemp = {}
			tabTemp.dwRoleID = dwRoleID
			tabTemp.szRoleName = tabData.szRoleName or ""
			tabTemp.dwIncoID = (tabInfo.GetIncoID and tabInfo:GetIncoID()) or 1001
			tabTemp.dwLevel = tabInfo.dwLevel or 1
			tabChartHead[eType][i] = tabTemp
		end
	end
	return tabChartHead
end
--设置排行榜数据
function CChartManager:SetChartData(tabRole,tabPrarm)
	for eType,dwValue in pairs(tabPrarm) do
		local dwRoleID = tabRole.dwRoleID
		local tabData = self.tabChartData[eType][dwRoleID]
		if tabData then
			tabData.dwValue = dwValue
			self.objDB:SetChartData(eType,dwRoleID,tabData)
		else
			local dwMinValue = ChartCfg[eType].dwMinValue
			local tabTemp = self.tabChartList[eType][100]
			if tabTemp then dwMinValue = tabTemp.dwValue end
			if dwValue > dwMinValue then
				tabData = {}
                tabData.dwAccountID = tabRole.dwAccountID
				tabData.dwRoleID = tabRole.dwRoleID
				tabData.szRoleName = tabRole.szRoleName
				tabData.eType = eType
				tabData.dwValue = dwValue
				self.tabChartData[eType][dwRoleID] = tabData
				self.objDB:AddChartData(eType,dwRoleID,tabData)
			end
		end
	end
end
--更新排行榜列表
function CChartManager:UpdateChartList()
	for k, v in pairs(self.tabChartTemp) do
		self.tabChartList[k] = v;
	end
end
--更新排行榜
function CChartManager:UpdateChart(eType)
	--完成
	if not eType or eType == 0 then
		self:UpdateChartList();
		self.tabChartTemp = {}
		self.tabChartRole = self:ParseChartRole(self.tabChartList)
		self.tabChartHead = self:ParseChartHead(self.tabChartList)
		local tabLineList = CGameLineManager:GetAllLine()
		for k,v in pairs(tabLineList) do
			for eType,tabSub in pairs(self.tabChartHead) do
				local tabDataMsg = ChartParseList(tabSub,ChartHeadMsgStN)
				v.OnKSUpdateChartHeadMsg{ Type = eType,Chart = tabDataMsg }
			end
			v.OnKSSyncChartMsg {}
		end
		return
	end

	--排序
	local tabTemp = {}
	for dwNumber,tabData in pairs(self.tabChartData[eType]) do
		local tabCopy = {}
		for k,v in pairs(tabData) do tabCopy[k] = v end
		local tabRole = self.tabChartRole[tabData.dwRoleID]
		if tabRole and tabRole[eType] then
			tabCopy.dwNumber = tabRole[eType].dwNumber or 101
		else
			tabCopy.dwNumber = 101
		end
		table.insert(tabTemp,tabCopy)
	end

    -- 补发排行榜奖励
	local b, s = pcall(
        function()
            CChartAwardManager:ChartAwardOfflineGet(
                eType, tabTemp
            );
        end
    );
	if not b then 
        _err(s);
    end

	local fnSort = function(a,b)
		if a.dwValue ~= b.dwValue then
			return a.dwValue > b.dwValue
		else
			if a.dwNumber ~= b.dwNumber then
				return a.dwNumber < b.dwNumber
			else
				return a.dwRoleID < b.dwRoleID
			end
		end
	end
	table.sort(tabTemp,fnSort)
	for dwNumber,tabData in pairs(tabTemp) do
		tabData.dwNumber = dwNumber
		local tabSub = self.tabChartRole[tabData.dwRoleID]
		if tabSub and tabSub[eType] then
			tabData.dwChange = tabSub[eType].dwNumber - dwNumber
            tabData.dwAccountID = tabSub[eType].dwAccountID
		else
			tabData.dwChange = 100 + 1 - dwNumber
            tabData.dwAccountID = 0
		end
	end
	--整理
	local dwLength = #tabTemp
	for i = 100 * 2 + 1,dwLength do
		local dwRoleID = tabTemp[i].dwRoleID
		self.tabChartData[eType][dwRoleID] = nil
	end
	local tabData = tabTemp[100 * 2]
	if tabData then
		self.objDB:DelChartData(eType,tabData)
	end
	for i = 1,100 do
		self.objDB:SetChartList(eType,i,tabTemp[i])
	end
	for i = 100 + 1,dwLength do
		tabTemp[i] = nil
	end
	self.tabChartTemp[eType] = tabTemp
	--记录
	for i,v in ipairs(tabTemp) do
		CLogSystemManager:chart(i,
            v.dwAccountID,
            v.dwRoleID,
            v.szRoleName,
            v.dwValue,
            eType);
	end
	--同步
	local tabDataMsg = ChartParseList(tabTemp,ChartListMsgStN)
	local tabLineList = CGameLineManager:GetAllLine()
	local tabTempMsg = {{},{},{},{},{}}
	for i,v in pairs(tabDataMsg) do tabTempMsg[(i%5)+1][i] = v end
	for k,v in pairs(tabLineList) do
		v.OnKSUpdateChartListMsg { Type = eType,Chart = tabTempMsg }
	end
	CGuildChartMgr:UpdateChart(eType,tabTemp) --更新世家排行榜
end
-----------------------------------------------------------------------------------------------
