local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local data = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute(szCmd, dwRoleID);

    if #(dbres) > 0 then
        data[1] = dbres[1];
    end;
	
	CTransitManager:RecvData(dwAccountID,"CUnionPlatGiftSystem", data);
	return true;
end


CLoginCall:AddCall("CUnionPlatGiftSystem", func);