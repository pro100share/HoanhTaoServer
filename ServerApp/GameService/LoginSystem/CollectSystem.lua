

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local Info = {};
    local dbres = tbInfoList[1];
    if type(dbres) == "table" then
		Info = dbres;
    end;
	
	CTransitManager:RecvData(dwAccountID,"CCollectSystem",Info)
	return true;
end


CLoginCall:AddCall("CCollectSystem",func);


