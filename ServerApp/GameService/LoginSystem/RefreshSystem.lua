

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	
	--local szCmd = 'select * from "T_Role_Refresh" where "dwRoleID" = $1';
	local tabRes = tbInfoList[1]--objPlayer:GetDBQuery():execute(szCmd,dwRoleID);
	for i,v in pairs(tabRes or {}) do
		tabData[v.dwDataID] = { dwValue = v.dwValue, dwUpdate = v.dwUpdate };
	end
	
	CTransitManager:RecvData(dwAccountID,"CRefreshSystem",tabData);
	return true;
end


CLoginCall:AddCall("CRefreshSystem",func);
