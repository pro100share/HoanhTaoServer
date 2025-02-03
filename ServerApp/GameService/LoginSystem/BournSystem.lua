

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
    local dbres = tbInfoList[1];
    if #(dbres) > 0 then
		tabData[1] = dbres[1].dwBournExp;
		tabData[2] = dbres[1].dwBournPVPExp;
		tabData[3] = dbres[1].dwBournLv;
    else--if isNewRole then
        tabData[1] = 0;
		tabData[2] = 0;
		tabData[3] = 1;
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Bourn');
        SqlCmd.Fields.dwRoleID				= dwRoleID;		
        SqlCmd.Fields.dwBournExp			= 0;		
        SqlCmd.Fields.dwBournPVPExp			= 0;		
        SqlCmd.Fields.dwBournLv				= 1;				
        SqlCmd:execute()
    end;
	
    CTransitManager:RecvData(dwAccountID,"CBournSystem",tabData);
	return true;
end


CLoginCall:AddCall("CBournSystem",func);



