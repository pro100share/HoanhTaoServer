

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Plus_Info" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
    if #(dbres) > 0 then
		Data[1] = dbres[1].dwPKMode;
		Data[2] = dbres[1].dwPKValue;
		Data[3] = dbres[1].dwMuseBegin;
    else--if isNewRole then
		Data[1] = enPKMode.ePK_Peace;
		Data[2] = 0;
		Data[3] = 0;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Plus_Info");
		SqlCmd.Fields.dwRoleID  = dwRoleID;
		SqlCmd.Fields.dwPKMode	= Data[1];
		SqlCmd.Fields.dwPKValue	= Data[2];
		SqlCmd.Fields.dwMuseBegin = Data[3];
		SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CPKSystem", Data);
	return true;
end;


CLoginCall:AddCall("CPKSystem", func);



