
_G.CEscortManager = CSingle:new();
CSingleManager:AddSingle(CEscortManager);
--create
function CEscortManager:Create()
	local Time = {dwTime = _G.RefreshMonsterTime.dwUpdateTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CEscortManager};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEscortManager.UpdateEscort, Param);
	return true;
end;

function CEscortManager:UpdateEscort()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Escort_Info" set "dwEscortNum" = $1, "dwRefQuality" = $2, "dwEscortID" = $3, "dwType" = $4, "dwQuality" = $5, "dwMapId" = $6, "dwGetType" = $7, "dwShellEscortNum" = $8',0,0,0,0,0,0,0,0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.UpdateEscortInfoMsg{};	
	end;
end;
