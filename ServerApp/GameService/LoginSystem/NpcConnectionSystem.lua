

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_NpcConnection" where "dwRoleID" = $1', dwRoleID);
    if #(dbres) > 0 then
		tabData = dbres[1];
    else--if isNewRole then
        tabData.dwRoleID = dwRoleID;
		local tNums = {}
		for i = 1,#NpcConnectionConfig do
			tNums[i] = -1;
		end
		tabData.sztNpcCurTearchNum = _G.fPackSZNumData(tNums) or '';
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_NpcConnection');
        SqlCmd.Fields.dwRoleID = tabData.dwRoleID;
        SqlCmd.Fields.sztNpcCurTearchNum = tabData.sztNpcCurTearchNum;
        SqlCmd:execute()
    end;
    
	CTransitManager:RecvData(dwAccountID,"CNpcConnectionSystem", tabData)
	return true;
end


CLoginCall:AddCall("CNpcConnectionSystem", func);



