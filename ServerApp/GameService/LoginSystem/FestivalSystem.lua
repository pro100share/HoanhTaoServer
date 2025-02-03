

local function func(objPlayer,tbInfoList)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local Info = {};
    local dbres = tbInfoList[1];
    if type(dbres) == "table" then
		Info = dbres;
    end;
	
	CTransitManager:RecvData(dwAccountID,"CFestivalSystem",Info)
	return true;
end


CLoginCall:AddCall("CFestivalSystem",func);


