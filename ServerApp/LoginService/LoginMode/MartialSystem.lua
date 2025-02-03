

local function func(dwAccountID, dwRoleID, szRoleName, dwProf)
    local Data = {
        [1] = 0;
    };
	local dbres = CPlayerDBQuery:execute('select * from "T_Role_Martial_Info" where "dwRoleID" = $1',dwRoleID);
	if type(dbres) == "table" then
		Data[1] = dbres[1].dwSkillID;
    elseif dbres == nil then
        local SqlCmd = CPlayerDBQuery:CreateInsertCmd('T_Role_Martial_Info');
        SqlCmd.Fields.dwRoleID = dwRoleID;
        SqlCmd.Fields.dwSkillID = 0;
        SqlCmd:execute();
    else	
        return false;
    end;
	
	CKSApp:SetLineData(dwAccountID,"CMartialSystem", Data);
	return true;
end;


--CLoginCall:AddCall(func);



