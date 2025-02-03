

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_KungFu_Info" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
    if #(dbres) > 0 then
		tabData[1] = dbres[1];
    end
	CTransitManager:RecvData(dwAccountID,"CChallengeQunXiaSystem", tabData);
	return true;
end


CLoginCall:AddCall("CChallengeQunXiaSystem", func);



