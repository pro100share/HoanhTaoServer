

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
    local dbres = tbInfoList[1]
    if dbres then
		tabData = dbres[1];
	end;
    CTransitManager:RecvData(dwAccountID,"CTalkSwordSystem",tabData);
    return true;
end;


CLoginCall:AddCall("CTalkSwordSystem",func);