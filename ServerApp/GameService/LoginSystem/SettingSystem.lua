

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local sInfo = SSettingInfo:new();
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Setting" where "dwRoleID" = $1', dwAccountID);
    if #(dbres) > 0 then
		for index, Row in pairs(dbres) do
            for k, v in pairs(Row) do
                sInfo[k] = v;
            end
        end
    else--if isNewRole then
        sInfo.dwRoleID = dwAccountID;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Setting');
        for k, v in pairs(sInfo) do
            SqlCmd.Fields[k] = v;
        end;
        SqlCmd:execute();
    end;
    
	CTransitManager:RecvData(dwAccountID,"CSettingSystem", {sInfo = sInfo});
	return true;
end;


CLoginCall:AddCall("CSettingSystem", func);



