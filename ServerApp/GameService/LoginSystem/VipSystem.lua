
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
    local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Vip" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
    if #(dbres) > 0 then
		tabData[1] = dbres[1].dwTimeLast;
		tabData[2] = dbres[1].dwTransportNum;
		tabData[3] = dbres[1].dwGetItem;
	else--if isNewRole then
        tabData[1] = 0;
        tabData[2] = 0;
        tabData[3] = 0;
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Vip');
        SqlCmd.Fields.dwRoleID				= dwRoleID;		
        SqlCmd.Fields.dwTimeLast			= 0;		
        SqlCmd.Fields.dwTransportNum		= 0;		
        SqlCmd.Fields.dwGetItem				= 0;				
        SqlCmd:execute();
	end;
	_info("CVipSystem::Select dwTimeLastdwTimeLast",tabData[1])
    CTransitManager:RecvData(dwAccountID,"CVipSystem",tabData);
    return true;
end;


CLoginCall:AddCall("CVipSystem",func);



