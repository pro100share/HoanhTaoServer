

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1];
	if #(dbres) > 0 then
		tabData = dbres[1];
		tabData.bFlag = true;
	else
		tabData.bFlag = false;
    end;
    
	CTransitManager:RecvData(dwAccountID,"CAutoBattleSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CAutoBattleSystem",func);



