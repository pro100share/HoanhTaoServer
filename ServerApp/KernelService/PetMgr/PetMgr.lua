--[[
功能：全局宠物管理器
类型：继承于CSingle类，用来管理玩家宠物
版本：
]]

_G.CPetMgr = CSingle:new();
CSingleManager:AddSingle(CPetMgr);
--create
function CPetMgr:Create()	
	self:RegClearPet()
	return true;
end;
--更新次数限制
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