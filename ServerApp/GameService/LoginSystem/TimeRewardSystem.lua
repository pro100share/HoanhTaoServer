

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local data = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute(szCmd, dwRoleID);
	data[1] = {}
    data[1].isNewRole = true
    if dbres and #(dbres) > 0 then
        data[1] = dbres[1];
        data[1].isNewRole = isNewRole
    end;
	

	local dbres2 = tbInfoList[2]--objPlayer:GetDBQuery():execute('select * from "T_Role_Mount" where "n_RoleID" = $1', dwRoleID);
	data[2] = {};
    if dbres2 and #(dbres2) > 0 then
		data[2].tmCreateRoleTime = dbres2[1].tmCreateRoleTime;
    else
        data[2].tmCreateRoleTime = GetCurTime();
    end;
	
	CTransitManager:RecvData(dwAccountID,"CTimeRewardSystem", data);
	return true;
end


CLoginCall:AddCall("CTimeRewardSystem", func);



