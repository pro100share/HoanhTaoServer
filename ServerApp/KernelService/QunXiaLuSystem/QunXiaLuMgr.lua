--[[
功能：群侠录管理器
类型：继承于CSingle类，
版本：
	v1.0	2014-1-3 create by lzc
]]


_G.CQunXiaLuMgr = CSingle:new();
CSingleManager:AddSingle(CQunXiaLuMgr);

--create
function CQunXiaLuMgr:Create()
	--风云客栈定时刷新卡片
	for k,szTime in pairs(_G.QunXiaLodgeConfig.setRefreshTime) do
		CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function()
			self:HotelRefreshCard(szTime)
		end,{})
	end
	
	--风云客栈每日重置刷新次数
	CAlarmClock:AddTask({dwTime = szTime}, CAlarmTaskCycleType.eDay, 1, 0,
	function()
		self:HotelResetCount()
	end,{})
	
	return true;
end;

--update
function CQunXiaLuMgr:Update(dwInterval)
	return true
end

function CQunXiaLuMgr:Destroy()
end


--风云客栈定时刷新卡片
function CQunXiaLuMgr:HotelRefreshCard(szTime)
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CQunXiaLuSystem", Func = "RefreshHotelCardEx", Args = {3, szTime}};
	end;	
end


--风雨客栈每日重置刷新次数
function CQunXiaLuMgr:HotelResetCount()
	CPlayerDBQuery:GetDBQuery():execute('UPDATE "T_Role_QunXiaLu" SET "dwHotelPrestigeCount"=$1, "dwHotelGoldCount"=$2', 0, 0);
	
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CQunXiaLuSystem", Func = "HotelResetCount"};
	end;	
end
