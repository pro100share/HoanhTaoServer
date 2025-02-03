

_G.CGourdSystemMrg = CSingle:new();
CSingleManager:AddSingle(CGourdSystemMrg);
--create
function CGourdSystemMrg:Create()
	self:HotUpdateGourd();
	self:ClearHotUpdate();
	self:GourdAddTimes();
	return true;
end;
function CGourdSystemMrg:HotUpdateGourd()
	local Time = {dwTime = _G.GourdHotUpdateTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CGourdSystemMrg};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CGourdSystemMrg:HotUpdateInfo() end, Param);
end
function CGourdSystemMrg:HotUpdateInfo()
	UpdateGourdConfig:Reload()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_Gourd" set "dwCurItemInfos" = $1', '0;0;0;0;');
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.Gourd_KSGourdHotUpdateMsg{}
	end
end

--更新次数限制
function CGourdSystemMrg:ClearHotUpdate()
	local Time = {dwTime = _G.GourdClearTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CGourdSystemMrg};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes,function() CGourdSystemMrg:ClearHotUpdateInfo() end, Param);
end;

function CGourdSystemMrg:ClearHotUpdateInfo()
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.Gourd_KSClearHotUpdateInfoMsg{}
	end
end;

function CGourdSystemMrg:GourdAddTimes()
	local Time = {dwTime = _G.GourdAddTimes};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CGourdSystemMrg};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CGourdSystemMrg:GourdAddTimesInfo() end, Param);

end

function CGourdSystemMrg:GourdAddTimesInfo() 
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_Gourd" set "dwAddTimesItemIndex" = $1', 0);
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_Gourd" set "dwCurItemInfos" = $1', '0;0;0;0;');
	local tabLineList = CGameLineManager:GetAllLine()
	for k,v in pairs(tabLineList) do
		v.Gourd_KSClearAddTimesInfoMsg{}
	end
end