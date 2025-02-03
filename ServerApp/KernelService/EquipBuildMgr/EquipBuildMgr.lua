--[[
���ܣ�ȫ��װ������������
���ͣ��̳���CSingle�࣬�����������װ������
�汾��
]]

_G.CEquipBuildMgr = CSingle:new();
CSingleManager:AddSingle(CEquipBuildMgr);
--create
function CEquipBuildMgr:Create()	
	self:ClearEquipBuild()
	return true;
end;
--���´�������
function CEquipBuildMgr:ClearEquipBuild()
	local Time = {dwTime = "24:00"};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CEquipBuildMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CEquipBuildMgr.ClearEquipInfo, Param);
end;

function CEquipBuildMgr:ClearEquipInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_EquipBuild_Info" set "dwBuildNum" = $1', 0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.UpdateEquipBuildMsg{};	
	end;	
end;

