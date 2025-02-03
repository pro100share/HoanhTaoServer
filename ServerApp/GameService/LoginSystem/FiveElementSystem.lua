

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_FiveElem" where "dwRoleID" = $1 LIMIT 1',dwRoleID);
    if #(dbres) > 0 then
		local Row = dbres[1];
		tabData[1] = Row.dwMetalLv;
		tabData[2] = Row.dwWoodLv;
		tabData[3] = Row.dwWaterLv;
		tabData[4] = Row.dwFireLv;
		tabData[5] = Row.dwEarthLv;
		tabData[6] = Row.dwDantianLv;
		
		tabData[7] = Row.dwMetalValue;
		tabData[8] = Row.dwWoodValue;
		tabData[9] = Row.dwWaterValue;
		tabData[10] = Row.dwFireValue;
		tabData[11] = Row.dwEarthValue;
		
		tabData[12] = Row.dwCountTime;
		
		tabData[13] = Row.dwMetalTime;
		tabData[14] = Row.dwWoodTime;
		tabData[15] = Row.dwWaterTime;
		tabData[16] = Row.dwFireTime;
		tabData[17] = Row.dwEarthTime;
		tabData[18] = Row.szFillParam;
    else--if isNewRole then
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_FiveElem');
        SqlCmd.Fields.dwRoleID					= dwRoleID;	
        
        SqlCmd.Fields.dwMetalLv					= 0;		
        SqlCmd.Fields.dwWoodLv					= 0;		
        SqlCmd.Fields.dwWaterLv					= 0;		
        SqlCmd.Fields.dwFireLv					= 0;		
        SqlCmd.Fields.dwEarthLv					= 0;		
        SqlCmd.Fields.dwDantianLv				= 0;
        
        SqlCmd.Fields.dwMetalValue				= 0;		
        SqlCmd.Fields.dwWoodValue				= 0;		
        SqlCmd.Fields.dwWaterValue				= 0;		
        SqlCmd.Fields.dwFireValue				= 0;		
        SqlCmd.Fields.dwEarthValue				= 0;		
        SqlCmd.Fields.dwCountTime				= _now();		
        
        SqlCmd.Fields.dwMetalTime				= 0;
        SqlCmd.Fields.dwWoodTime 				= 0;
        SqlCmd.Fields.dwWaterTime 				= 0;
        SqlCmd.Fields.dwFireTime 				= 0;
        SqlCmd.Fields.dwEarthTime				= 0;
        SqlCmd.Fields.szFillParam				= '00000';
        
        SqlCmd:execute();
    end;
    
    CTransitManager:RecvData(dwAccountID,"CFiveElementSystem", tabData);
	return true;
end


CLoginCall:AddCall("CFiveElementSystem",func);



