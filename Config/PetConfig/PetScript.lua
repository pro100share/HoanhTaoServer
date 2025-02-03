_G.PetScript = {}
local GetPlayerByID = function(dwRoleID)
	return CPlayerManager:GetPlayerByRoleID(dwRoleID)
end
-----------------------------------------------------------------------
------------------------------------------------------------>冲榜类脚本

--Level:无结交条件
PetScript[1] = function(dwRoleID, attrTbl)
	return true;
end

--Level:玩家达到指定等级
PetScript[2] = function(dwRoleID, attrTbl)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local cfgLevel = attrTbl[1]
	if objPlayer:GetInfo().dwLevel < cfgLevel then
		return false;
	end;
	return true;
end


--是否接受某个任务
PetScript[3] = function(dwRoleID, attrTbl)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local dwAcceptId = attrTbl[1];
	local CScriptSystem = objPlayer:GetSystem("CScriptSystem");
	local dwAcceptState = CScriptSystem:CheckTaskState(dwAcceptId, _G.TaskStateConfig.Accept)
	if not dwAcceptState then
		return false;
	end;
	return true;
end

--是否完成某个任务
PetScript[4] = function(dwRoleID, attrTbl)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local dwCompleteTaskId = attrTbl[1];
	local CScriptSystem = objPlayer:GetSystem("CScriptSystem");
	local dwCompleteTaskState = CScriptSystem:CheckTaskState(dwCompleteTaskId, _G.TaskStateConfig.Complete)
	if not dwCompleteTaskState then
		return false;
	end;
	return true;
end

--检测充值总额
PetScript[5] = function(dwRoleID, attrTbl)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local dwChargeAll = attrTbl[1]
	local CScriptSystem = objPlayer:GetSystem("CScriptSystem");
	local chargeGold = CScriptSystem:GetCharge().All
	if chargeGold < dwChargeAll then
		return false;
	end;
	return true;
end

--检测消费总额
PetScript[6] = function(dwRoleID, attrTbl)
	local objPlayer = GetPlayerByID(dwRoleID)
	if not objPlayer then return false end;
	local dwCChargeAll = attrTbl[1]
	local CScriptSystem = objPlayer:GetSystem("CScriptSystem");
	local cchargeGold = CScriptSystem:GetCharge().CAll
	if cchargeGold < dwCChargeAll then
		return false;
	end;
	return true;
end

--Level:无结交条件
PetScript[100] = function(dwRoleID, attrTbl)
	return false;
end

