

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1];
    if #(dbres) > 0 then
		tabData = dbres[1];
    else--if isNewRole then
        --objPlayer:GetDBQuery():execute('insert into "T_Role_DataCenter" ("dwRoleID") values($1)', dwRoleID)
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_DataCenter');
		SqlCmd.Fields.dwRoleID				= dwRoleID;
		SqlCmd:execute()
    end;
		
	CTransitManager:RecvData(dwAccountID,"CDataCenterSystem",tabData)
	return true;
end


CLoginCall:AddCall("CDataCenterSystem",func);



