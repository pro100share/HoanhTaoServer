local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = {};
	local tabData1 = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1;
    else
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Escort_Info');
		SqlCmd.Fields.dwRoleId		= dwRoleID;
		SqlCmd:execute();	    
		local tbl = {};         
		tbl.dwEscortNum = 0;    
		tbl.dwRefQuality = 0;  	
		tbl.dwEscortID	= 0;	
		tbl.dwType = 0;
		tbl.dwQuality = 0;
		tbl.dwMapId = 0;
		tbl.dwGetType = 0;
		tbl.dwShellEscortNum = 0;
		table.insert(tabData, tbl);
	end;
	table.insert(lineData, tabData[1]);
	CTransitManager:RecvData(dwAccountID,"CEscortSystem", lineData);
	return true;
end;
CLoginCall:AddCall("CEscortSystem",func);