


_G.CMatrixMethodManager = CSingle:new();
CSingleManager:AddSingle(CMatrixMethodManager);
--create
function CMatrixMethodManager:Create()
	self:HotUpdateMatrixMethod()
	self:ClearFreeNumMatrixMethod()
	return true;
end;
--更新次数限制
function CMatrixMethodManager:HotUpdateMatrixMethod()
	local Time = {dwTime = _G.HotUpdateTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CMatrixMethodManager};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CMatrixMethodManager:HotUpdateInfo() end, Param);
end;
----清空每日免费使用次数
function CMatrixMethodManager:ClearFreeNumMatrixMethod()
	local Time = {dwTime = "6:00"};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CMatrixMethodManager};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CMatrixMethodManager:ClearFreeNumInfo() end, Param);
end
function CMatrixMethodManager:HotUpdateInfo()
	MatrixMethodConfig:Reload();
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.KSMatrixMethodHotUpdateMsg{}
	end
end;
function CMatrixMethodManager:ClearFreeNumInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_MatrixMethod" set "dwUsedFreeNum" = $1', 0);
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.KSMatrixMethodClearFreeNumMsg{}
	end
end