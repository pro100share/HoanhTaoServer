local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = nil;
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1[1];
	end;
		
	table.insert(lineData, tabData);
	CTransitManager:RecvData(dwAccountID,"CQingYunLingSystem", lineData);
	return true;
end;
CLoginCall:AddCall("CQingYunLingSystem",func);
