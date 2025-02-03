--[[
功能：全局装备修炼管理器
类型：继承于CSingle类，用来管理玩家装备修炼
版本：
]]

_G.CEquipBuildMgr = CSingle:new();
CSingleManager:AddSingle(CEquipBuildMgr);
--create
function CEquipBuildMgr:Create()	
	self:ClearEquipBuild()
	return true;
end;
--更新次数限制
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

