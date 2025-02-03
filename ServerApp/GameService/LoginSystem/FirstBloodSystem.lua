

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local data = {[1] = {},[2] = {}};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute(szCmd, dwRoleID);
    if dbres and #(dbres) > 0 then
		for k,v in pairs(dbres) do
			data[1][v.dwIndex] = v
		end
    else
    end;
	
	dbres = tbInfoList[2]--objPlayer:GetDBQuery():execute(szCountCmd, dwRoleID);
    if #(dbres) > 0 then
		for k,v in pairs(dbres) do
			data[2][v.dwIndex] = v.dwCount
		end
    else
    end;
	
	CTransitManager:RecvData(dwAccountID,"CFirstBloodSystem", data);
	return true;
end


CLoginCall:AddCall("CFirstBloodSystem",func);



