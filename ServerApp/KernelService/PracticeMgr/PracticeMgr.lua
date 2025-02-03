--[[
功能：全局修行管理器
类型：继承于CSingle类，用来管理玩家修行
版本：
]]

_G.CPracticeMgr = CSingle:new();
CSingleManager:AddSingle(CPracticeMgr);
--create
function CPracticeMgr:Create()	
	self:RegClearPractice()
	return true;
end;
--更新次数限制
function CPracticeMgr:RegClearPractice()
	local Time = {dwTime = _G.PracticeFunConfig.RefreshTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CPracticeMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CPracticeMgr.ClearPracticeInfo, Param);
end;

function CPracticeMgr:ClearPracticeInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Practice_Info" set "dwCurProgress" = $1', 0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.UpdatePracticeInfoMsg{};	
	end;	
end;

