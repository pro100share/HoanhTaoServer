--[[
功能：全局挑战群侠管理器
类型：继承于CSingle类，用来管理群侠挑战次数定时清除
版本：
	v1.0	2013-11-5 create by lizc
]]


_G.CChallengeQunXiaMgr = CSingle:new();
CSingleManager:AddSingle(CChallengeQunXiaMgr);


--create
function CChallengeQunXiaMgr:Create()	
	--初始化计时器
	CAlarmClock:AddTask({dwTime = _G.ChallengeQunXiaConfig.ResetTime}, CAlarmTaskCycleType.eDay, 1, 0,
		function() self:ResetValue() end, {}
	)
	return true;
end;

--重置
function CChallengeQunXiaMgr:ResetValue()
	CPlayerDBQuery:GetDBQuery():execute('UPDATE "T_Role_QunXia" SET "setQunXiaCount"=$1', "");
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CChallengeQunXiaSystem", Func = "Reset"};
	end;	
end;
