local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1[1];
    else
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Errant_Honor_Info');
		SqlCmd.Fields.dwRoleId		= dwRoleID;
		SqlCmd:execute();	
		tabData.dwErrantLevel = 1;
		tabData.dwErrantStar = 1;
		tabData.dwErrantValue = 0;
	end;
		
	table.insert(lineData, tabData);
	CTransitManager:RecvData(dwAccountID,"CErrantHonorSystem", lineData);
	return true;
end;
CLoginCall:AddCall("CErrantHonorSystem",func);
