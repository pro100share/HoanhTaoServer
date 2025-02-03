--[[
	--功能：全局聚灵管理器
	--类型：继承于CSingle类，用来管理玩家聚灵
	--作者：魏云
	--时间：2013-11-25
--]]
_G.CCollectJewelMgr = CSingle:new();
CSingleManager:AddSingle(CCollectJewelMgr);
--create
function CCollectJewelMgr:Create()	
	self:RegClearCollectJewel();
	self:OpenCollectJewel();
	return true;
end;
--更新次数限制
function CCollectJewelMgr:RegClearCollectJewel()
	local Time = {dwTime =CollectJewelConfig.ResetTime };
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CCollectJewelMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CCollectJewelMgr:ClearCollectJewelInfo() end, Param);
end;

function CCollectJewelMgr:ClearCollectJewelInfo()
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_CollectJewel" set "dwInjectJewelUseNum" = $1', '0;0;0;');
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_CollectJewel" set "dwInjectJewelUseTotalNum" = $1', 0);
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_CollectJewel" set "dwInjectJewelAddCanUseNum" = $1', '0;0;0;');
	CPlayerDBQuery:GetDBQuery():execute('update "T_Role_CollectJewel" set "dwInjectJewelAddCanUseTotalNum" = $1', 0);
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.KSClearCollectJewelInfoMsg{};	
	end;	
end;

function CCollectJewelMgr:OpenCollectJewel()
	local Time = {dwTime =CollectJewelConfig.SysOpenTime };
	local CycleType
		= _G.CAlarmTaskCycleType.eDay;
	local CycleTime = 1;
	local RunTimes = 0;
	local Param = {CCollectJewelMgr};
	local index = _G.CAlarmClock:AddTask(Time, CycleType, CycleTime, RunTimes, function() CCollectJewelMgr:StartCollectJewelInfo() end, Param);
end

function CCollectJewelMgr:StartCollectJewelInfo()
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.KSStartCollectJewelMsg{};	
	end;
end

