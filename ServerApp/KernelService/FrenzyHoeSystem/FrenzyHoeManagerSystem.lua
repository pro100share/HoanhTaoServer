_G.CFrenzyHoeManagerSystem = CSingle:new();
CSingleManager:AddSingle(CFrenzyHoeManagerSystem);
--create
function CFrenzyHoeManagerSystem:Create()
	self.dataList = {} ----挖宝传闻数据库列表
	self.dataList[1] = {}; ----挖宝事件列表
	self.dataList[2] = {}; ----挖宝传闻列表 最多20条可配置
	--self:ClearFriendNum();
	self:ClearHotUpdateFrenzyHoe();
	self:HotUpdateFrenzyHoe()
	self:UpdateDigEventSql()
	return true;
end;
--更新次数限制
function CFrenzyHoeManagerSystem:ClearFriendNum()
	-- local Time = {dwTime = _G.FrenzyHoeClearTime}; ----
	-- local CycleType
		-- = _G.CAlarmTaskCycleType.eDay;
	-- local CycleTime = 1;
	-- local RunTimes = 0;
	-- local Param = {CFrenzyHoeManagerSystem};
	-- local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes,function() CFrenzyHoeManagerSystem:ClearFriendNumInfo() end, Param);
end;

function CFrenzyHoeManagerSystem:ClearFriendNumInfo()
	-- CPlayerDBQuery:GetDBQuery():execute('update "T_Role_FrenzyHoe" set "dwFrendNum" = $1', 0);
	-- local tabLineList = CGameLineManager:GetAllLine()
	-- for k,v in pairs(tabLineList) do
		-- v.FrenzyHoe_KSZeroClearFriendNumMsg{}
	-- end
end;
function CFrenzyHoeManagerSystem:HotUpdateFrenzyHoe()
	local Time = {dwTime = _G.FrenzyHoeHotUpdateTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CFrenzyHoeManagerSystem};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CFrenzyHoeManagerSystem:HotUpdateInfo() end, Param);
end
function CFrenzyHoeManagerSystem:HotUpdateInfo()
	FrenzyHoeConfig:Reload();
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.KSFrenzyHoeHotUpdateMsg{}
	end
end

function CFrenzyHoeManagerSystem:ClearHotUpdateFrenzyHoe()
	local Time = {dwTime = _G.ClearFrenzyHoeHUT};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CFrenzyHoeManagerSystem};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CFrenzyHoeManagerSystem:ClearHotUpdateInfo() end, Param);
end

function CFrenzyHoeManagerSystem:ClearHotUpdateInfo()
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.KSClearFrenzyHoeHotUpdateMsg{}
	end
end
--------检查表T_Item_FrenzyHoe 里是否有该物品
function CFrenzyHoeManagerSystem:CheckAwardItemIdIsInSql(dwAardItemID)
	local dwHas = false
	local dbres = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Item_FrenzyHoe" where "dwAwardItemId" = $1', dwAardItemID) or {};
	if(#dbres > 0) then
		dwHas = true
	end
	return dwHas
end


function CFrenzyHoeManagerSystem:UpdateAwardItemInfo(ParamInfo)
	self:UpdateBroadCastInfo(ParamInfo)
	self:UpdateDigEvent(ParamInfo)
end

function CFrenzyHoeManagerSystem:UpdateDigEventSql()
	local dbres = CPlayerDBQuery:GetDBQuery():execute('select * from "T_Item_FrenzyHoe"') or {};
	if(#dbres > 0) then
		for k,v in pairs(dbres) do
			self.dataList[1][k] = {}
			self.dataList[1][k].dwRoleId = v.dwRoleId;
			self.dataList[1][k].dwAwardItemId = v.dwAwardItemId;
			self.dataList[1][k].szRoleName = v.szRoleName;
		end
	end
end

----更新挖宝事件内存信息
function CFrenzyHoeManagerSystem:UpdateDigEvent(ParamInfo)
	local awardItemId = ParamInfo.dwAwardItemId
	local dwHas = false
	if(#self.dataList[1] > 0) then
		for k,v in pairs(self.dataList[1]) do
			if(v.dwAwardItemId == awardItemId) then
				self.dataList[1][k].dwRoleId = ParamInfo.dwRoleId;
				self.dataList[1][k].dwAwardItemId = awardItemId;
				self.dataList[1][k].szRoleName = ParamInfo.szRoleName;
				dwHas = true
				break
			end
		end
	end
	if(not dwHas) then
		local digEventInfo = {
			dwRoleId = ParamInfo.dwRoleId;
			dwAwardItemId = awardItemId;
			szRoleName = ParamInfo.szRoleName;
		}
		table.insert(self.dataList[1],digEventInfo)
	end
end

function CFrenzyHoeManagerSystem:UpdateBroadCastInfo(ParamInfo)
	local maxnum = #self.dataList[2]
	if(maxnum >= TreasureMaxNum) then
		for i = (TreasureMaxNum-1), 1 ,-1 do
			self.dataList[2][i+1] =self.dataList[2][i]
		end
		self.dataList[2][1] = ParamInfo;
		
	else
		for i = maxnum,1,-1 do
			self.dataList[2][i+1] = self.dataList[2][i]
		end
		self.dataList[2][1] = ParamInfo;
	end
end

