

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = {
        [1] = 0;
    };
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Martial_Info" where "dwRoleID" = $1',dwRoleID);
	if #(dbres) > 0 then
		Data[1] = dbres[1].dwSkillID;
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Martial_Info');
        SqlCmd.Fields.dwRoleID = dwRoleID;
        SqlCmd.Fields.dwSkillID = 0;
        SqlCmd:execute();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CMartialSystem", Data);
	return true;
end;


CLoginCall:AddCall("CMartialSystem", func);



