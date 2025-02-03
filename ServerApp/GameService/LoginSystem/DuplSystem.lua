

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
	
    local tabData = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1;
    else	
        
    end;
    
	local planDate = 5;
    local dbres2 = tbInfoList[2];--objPlayer:GetDBQuery():execute('select "bossTimes" from "T_Dupl_ZL_Info" where "roleId" = $1', dwRoleID);
    if #(dbres2) > 0 then
		planDate = dbres2[1].bossTimes;
    else--if isNewRole then
       -- objPlayer:GetDBQuery():execute('insert into "T_Dupl_ZL_Info" ("roleId") values($1)', dwRoleID);
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Dupl_ZL_Info');
		SqlCmd.Fields.roleId = dwRoleID;
		SqlCmd:execute()
    end;
    
	local jiFenData = {};
	local dbres3 = tbInfoList[3];
	for _,info in pairs(dbres3)do
		jiFenData[info.dwDuplId] = info.dwScore;
	end
	for dwDuplID,info in pairs(_G.DuplConfig)do
		if info.dwShowJiFen and info.dwShowJiFen == 1 then
			if not jiFenData[dwDuplID] then
				jiFenData[dwDuplID] = 0;
				
				local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Dupl_JiFen_Info');
				SqlCmd.Fields.dwRoleId = dwRoleID;
				SqlCmd.Fields.dwDuplId = dwDuplID;
				SqlCmd.Fields.szRoleName = objPlayer:GetName();
				SqlCmd:execute()
			end
		end
	end
    
    local hitBossInfo = "";
    local dbres4 = tbInfoList[4];--objPlayer:GetDBQuery():execute('select "hitBossInfo" from "T_Dupl_ZL_Boss_Record" where "roleId" = $1', dwRoleID);
    if #(dbres4) > 0 then
		hitBossInfo = dbres4[1].hitBossInfo;
    else--if isNewRole then
        --objPlayer:GetDBQuery():execute('insert into "T_Dupl_ZL_Boss_Record" ("roleId") values($1)', dwRoleID);
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Dupl_ZL_Boss_Record');
		SqlCmd.Fields.roleId = dwRoleID;
		SqlCmd:execute()
    end;
    
	table.insert(lineData, tabData);
	table.insert(lineData, planDate);
	table.insert(lineData, jiFenData);
    table.insert(lineData, hitBossInfo);
	
    
	CTransitManager:RecvData(dwAccountID,"CDuplSystem", lineData);
	return true;
end


CLoginCall:AddCall("CDuplSystem", func);



