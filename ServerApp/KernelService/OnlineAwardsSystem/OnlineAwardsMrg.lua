
--[[
	--���ܣ�ȫ���������������
	--���ͣ��̳���CSingle�࣬������������������
	--���ߣ�κ��
	--ʱ�䣺2013-11-29
--]]
_G.COnlineAwardsMgr = CSingle:new();
CSingleManager:AddSingle(COnlineAwardsMgr);
--create
function COnlineAwardsMgr:Create()	
	self:RegClearCOnlineAwardsMgr();
	return true;
end;
--���´�������
function COnlineAwardsMgr:RegClearCOnlineAwardsMgr()
	local Time = {dwTime =OnlineAwardsConfig.ResetTime };
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {COnlineAwardsMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() COnlineAwardsMgr:ClearOnlineAwardsInfo() end, Param);
end;

function COnlineAwardsMgr:ClearOnlineAwardsInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_OnlineAwards" set "dwUsedNum" = $1', 0);
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_OnlineAwards" set "dwAwardIndexs" = $1', '0;0;0;0;0;0;0;0;');
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_OnlineAwards" set "dwAwardTypes" = $1', '0;0;0;0;0;0;0;0;');
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_OnlineAwards" set "dwAwardStates" = $1', '0;0;0;0;0;0;0;0;');
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_OnlineAwards" set "dwInterTime" = $1', 0);
	
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.KSClearOnlineAwardsInfoMsg{};	
	end;	
end;