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
	self.tabChartList = {}
	self.tabChartRole = {}
	self.tabChartTemp = {}
	self.tabChartHead = {}
	
	for _,eType in pairs(ChartSwitch) do
		local tabTime = { dwTime = ChartBroadCastCfg[eType].szTime }
		local fnFunc = function()
			local szText = self:ParseChartNote(eType)
			self:BoradCast(szText)
		end
		CAlarmClock:AddTask(tabTime,CAlarmTaskCycleType.eDay,1,0,fnFunc,{})
	end
	
	CKernelApp.KSInitChartListMsg{ Line = CKernelApp.dwLineID }
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
--获得排名
function CChartManager:GetChartNumber(eChart,szIndex,uValue)
	local tabChart = self.tabChartList[eChart]
	for dwNumber,tabInfo in pairs(tabChart or {}) do
		if tabInfo[szIndex] == uValue then return dwNumber end
	end
end
--获得排行榜信息
function CChartManager:GetChartInfo(eType)
	return self.tabChartList[eType]
end
--获得排行榜人物
function CChartManager:GetChartRole(dwRoleID)
	return self.tabChartRole[dwRoleID] or {}
end
--获得排行榜头像
function CChartManager:GetChartHead(eType)
	return self.tabChartHead[eType] or {}
end
--更新排行榜数据
function CChartManager:UpdateChartData(nID)
	CKernelApp.KSUpdateChartListMsg{ID = nID}
end
--更新排行榜列表
function CChartManager:UpdateChartList()
	for k, v in pairs(self.tabChartTemp) do
		self.tabChartList[k] = v;
	end
end
-----------------------------------------------------------------------------------------------
--广播信息
function CChartManager:BoradCast(szText)
	local tabPlayerList = CMapManager:GetPlayer();
	for dwRoleID, objPlayer in pairs(tabPlayerList) do
		objPlayer.OnGetChartBroadCastMsg { Info = szText }
	end
end
-----------------------------------------------------------------------------------------------
--响应
-----------------------------------------------------------------------------------------------
function CChartManager:OnKSUpdateChartList(eType,tabChart)
	self.tabChartTemp[eType] = tabChart

    -- 删除奖励缓存
	local b, s = pcall(
        function()
            for k, v in pairs(CPlayerManager.setAllPlayer) do
                v:GetSystem("CChartAwardSystem"):DeleteReceived(eType);
            end
        end
    );
	if not b then 
        _err(s);
    end
end
function CChartManager:OnKSUpdateChartHead(eType,tabChart)
	self.tabChartHead[eType] = tabChart
end
function CChartManager:OnKSInitChart(eType,tabChart)
	self:UpdateChartList();
	self.tabChartTemp = {}
	self.tabChartRole = self:ParseChartRole(self.tabChartList)
end
function CChartManager:OnKSSyncChart(eType,tabChart)
	self:UpdateChartList();
	self.tabChartTemp = {}
	self.tabChartRole = self:ParseChartRole(self.tabChartList)
	
	local tabPlayerList = CMapManager:GetPlayer()
	for _,objPlayer in pairs(tabPlayerList) do
		local sysChart = objPlayer:GetSystem('CChartSystem')
		sysChart:UpdateChartData()
		local sysEvent = objPlayer:GetSystem('CPlayerEventCenterSystem')
		sysEvent:DoEvent(enumPlayerEventType.EventChartRefresh,eType)
		objPlayer.OnChartRefreshMsg {}
	end
end
-----------------------------------------------------------------------------------------------
--私有
-----------------------------------------------------------------------------------------------
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
function CChartManager:ParseChartNote(eType)
	if not self.tabChartList[eType][1] then
		return ChartBroadCastCfg[eType].szZero
	end
	local szText = ChartBroadCastCfg[eType].szInfo
	while(string.find(szText,'#')) do
		local dwIndex = string.find(szText,'#')
		local dwNumber = tonumber(string.sub(szText,dwIndex+1,dwIndex+1))
		local szRoleName = ''
		local tabData = self.tabChartList[eType][dwNumber]
		if tabData then szRoleName = tabData.szRoleName end
		szText = string.gsub(szText,'#'..dwNumber,szRoleName)
	end
	return szText
end
-----------------------------------------------------------------------------------------------
