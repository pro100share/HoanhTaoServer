

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Gift" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
    if #(dbres) > 0 then
		local Row = dbres[1];
		tabData[1] = Row.dwLevelGiftSeq;
		tabData[2] = Row.dwTimeGiftSeq;
		tabData[3] = Row.dwTimeRemain;
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Gift');
        SqlCmd.Fields.dwRoleID				= dwRoleID;	
        
        SqlCmd.Fields.dwLevelGiftSeq			= 0;		
        SqlCmd.Fields.dwTimeGiftSeq				= 0;		
        SqlCmd.Fields.dwTimeRemain				= 0;		
        
        SqlCmd:execute();
    end;
    
	CTransitManager:RecvData(dwAccountID,"CGiftSystem", tabData);
	return true;
end


CLoginCall:AddCall("CGiftSystem", func);



