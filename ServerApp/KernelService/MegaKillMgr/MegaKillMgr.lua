﻿_G.CMegaKillMgr = CSingle:new();CSingleManager:AddSingle(CMegaKillMgr);--createfunction CMegaKillMgr:Create()		--初始化计时器	CAlarmClock:AddTask({dwTime = _G.MegaKillConfig.ResetTime}, CAlarmTaskCycleType.eDay, 1, 0,		function() self:ResetValue() end, {}	)	return true;end;--重置function CMegaKillMgr:ResetValue()	CPlayerDBQuery:GetDBQuery():execute('UPDATE "T_Role_MegaKill" SET "dwRandomNum"=$1, "dwBuyNum"=$2, "strKillRecord"=$3', _G.MegaKillConfig.RandomNum, 0, "");	for i,objLine in pairs(CGameLineManager:GetAllLine()) do		objLine.GSRemoteCallMsg{System = "CMegaKillSystem", Func = "Reset"};	end;	end;