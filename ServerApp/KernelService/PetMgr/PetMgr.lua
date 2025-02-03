--[[
���ܣ�ȫ�ֳ��������
���ͣ��̳���CSingle�࣬����������ҳ���
�汾��
]]

_G.CPetMgr = CSingle:new();
CSingleManager:AddSingle(CPetMgr);
--create
function CPetMgr:Create()	
	self:RegClearPet()
	return true;
end;
--���´�������
function CPetMgr:RegClearPet()
	local Time = {dwTime = _G.PetFunctionConfig.RefreshTime};
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CPetMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, CPetMgr.ClearPetInfo, Param);
end;

function CPetMgr:ClearPetInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Pet_Info" set "dwDayConsult" = $1', 0);
	CPlayerDBQuery:GetDBQuery():execute('update "T_Pet_Info" set "dwDayImpart" = $1', 0);
	CPlayerDBQuery:GetDBQuery():execute('update "T_PetWash_Info" set "dwWashCount" = $1', 0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.UpdatePetInfoMsg{};	
	end;	
end;