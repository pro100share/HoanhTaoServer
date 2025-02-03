local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
    local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Sword" where "dwRoleId" = $1', dwRoleID);
    if #(dbres) > 0 then
		tabData = dbres[1];
    end;

	CTransitManager:RecvData(dwAccountID,"CGestSystem", tabData)
	return true;
end


CLoginCall:AddCall("CGestSystem",func);
