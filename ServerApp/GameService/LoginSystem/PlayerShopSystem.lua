

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
	local szShopName = nil;
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_PlayerShopItem" where "dwRoleID" = $1', dwRoleID);
    if #(dbres) > 0 then
		for k, Row in pairs (dbres) do
			tabData[k] = {}
			tabData[k][1] = Row.dwItemID
			tabData[k][2] = Row.bPriceType
			tabData[k][3] = Row.dwPrice
		end
    end;
    local dbres2 = tbInfoList[2]
	if #dbres2 > 0 then
		tabData.szShopName = dbres2[1].szShopName or ""
	else--if isNewRole then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_PlayerShopName');
        SqlCmd.Fields.dwRoleID		= dwRoleID;	
        SqlCmd.Fields.szShopName	= '';		
        SqlCmd:execute();
	end;
    CTransitManager:RecvData(dwAccountID,"CPlayerShopSystem",tabData);
	return true;
end


CLoginCall:AddCall("CPlayerShopSystem",func);



