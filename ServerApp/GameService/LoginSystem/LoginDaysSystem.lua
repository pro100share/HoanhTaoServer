
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
    local tabData = {};
    local dbres = tbInfoList[1]
    if #(dbres) > 0 then
		tabData.dwRoleID = dbres[1].dwRoleID;
		tabData.szLoginDays = dbres[1].szLoginDays;
	else--if isNewRole then
        tabData.dwRoleID=dwRoleID;
		tabData.szLoginDays=string.rep(" ",366);
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_LoginDays');
        SqlCmd.Fields.dwRoleID				= dwRoleID;		
        SqlCmd.Fields.szLoginDays			= string.rep(" ",366);
        SqlCmd:execute();
	end;
	_info("CVipSystem::Select dwTimeLastdwTimeLast",tabData[1])
    CTransitManager:RecvData(dwAccountID,"CLoginDaysSystem",tabData);
    return true;
end;


CLoginCall:AddCall("CLoginDaysSystem",func);



