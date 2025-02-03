

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Pulse" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
	if #dbres > 0 then 
		local Row = dbres[1];
		tabData[1] = Row.dwPulse1;
		tabData[2] = Row.dwPulse2;
		tabData[3] = Row.dwPulse3;
		tabData[4] = Row.dwPulse4;
		tabData[5] = Row.dwPulse5;
		tabData[6] = Row.dwPulse6;
		tabData[7] = Row.dwPulse7;
		tabData[8] = Row.dwPulse8;
		tabData[9] = Row.dwTotalExp;
		tabData[10] = Row.dwCountTime;
		tabData[11] = Row.dwLastTimes;
		tabData[12] = Row.dwWuValue;
		tabData[13] = Row.dwWuType;
		tabData[16] = Row.dwDraPul;
	else--if isNewRole then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Pulse');
        SqlCmd.Fields.dwRoleID					= dwRoleID;	
        
        SqlCmd.Fields.dwPulse1					= 0;		
        SqlCmd.Fields.dwPulse2					= 0;		
        SqlCmd.Fields.dwPulse3					= 0;		
        SqlCmd.Fields.dwPulse4					= 0;		
        SqlCmd.Fields.dwPulse5					= 0;		
        SqlCmd.Fields.dwPulse6					= 0;
        SqlCmd.Fields.dwPulse7					= 0;		
        SqlCmd.Fields.dwPulse8					= 0;
        
        SqlCmd.Fields.dwTotalExp				= 0;		
        SqlCmd.Fields.dwLastTimes				= 12;		--≥ı ºªØ «24
        
        SqlCmd.Fields.dwCountTime 				= 0;
        SqlCmd.Fields.dwWuValue 				= 0;
        SqlCmd.Fields.dwWuType	 				= 0;
		SqlCmd.Fields.dwDraPul               = 0;
        
        SqlCmd:execute();
	end;
	
	CTransitManager:RecvData(dwAccountID,"CPulseSystem", tabData);
	return true;
end;


CLoginCall:AddCall("CPulseSystem",func);



