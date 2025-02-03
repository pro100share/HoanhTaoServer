--[[
    [\brief 独孤九剑系统管理器
    [\author 王凌波
    [\date 2014-5-28
    [定时将修炼次数清零
  ]]

_G.CDuGuMgr = CSingle:new();
CSingleManager:AddSingle(CDuGuMgr);   

function CDuGuMgr:Create()
	local func = function() 
		self:ResetPracticeTimes();
	end
	CAlarmClock:AddTask({dwTime = _G.DuGuConfig.sResetTime}, 
        CAlarmTaskCycleType.eDay, 1, 0, func,{})
	return true;
end

-- 将玩家独孤九剑系统中修炼次数清零
function CDuGuMgr:ResetPracticeTimes()  
	-- 更新数据库
	CPlayerDBQuery:GetDBQuery():execute(
		'UPDATE "T_Role_DuGuJiuJian_Info" SET "nPrimaryTimes"=$1, \
        "nIntermediateTimes"=$2, "nAdvancedTimes"=$3', 0, 0, 0);
	-- 在线的玩家重置系统中的该属性
	for i,objLine in pairs(CGameLineManager:GetAllLine()) do
		objLine.GSRemoteCallMsg{System = "CDuGuSystem", Func = "ResetPracticeTimes"};
	end
end

function CDuGuMgr:Update(dwInterval)
	return true
end

function CDuGuMgr:Destroy()
end
