

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    
	local tabData = {}
    local dbres2 = tbInfoList[1];
	if #(dbres2) > 0 then
		tabData = dbres2;
    end;
    
	local buffInfo = {};
	local tb = {}
	local tbBuffToIndex = {}
	for i,row in pairs(tabData)do
		if not tb[row.dwBuffID] then
			tb[row.dwBuffID] = 1;
		else
			tbBuffToIndex[row.dwBuffID] = i;
			table.insert(buffInfo,{row.dwBuffID,row.dwEntityID})
		end
	end
	
	for _,info in pairs(buffInfo)do
		if info[1] and info[2] then
			local dwIn = tbBuffToIndex[info[1]];
			if dwIn then
				tabData[dwIn] = nil;
			end
			
			--objPlayer:GetDBQuery():execute('delete from "T_Role_Buff_Info" where "dwRoleID" = $1 and "dwBuffID" = $2 and "dwEntityID" = $3', dwRoleID, info[1], info[2]);
			
			local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Role_Buff_Info');
			SqlCmd.Wheres.dwRoleID = dwRoleID;
			SqlCmd.Wheres.dwBuffID = info[1];
			SqlCmd.Wheres.dwEntityID = info[2];
			SqlCmd:execute();
		end
	end
	
	local entityId = 0;
	for n,row in pairs(tabData)do
		if entityId < row.dwEntityID then
			entityId = row.dwEntityID;
		end
	end
    
	local lineData = {};
	table.insert(lineData, tabData);
	table.insert(lineData, entityId);
	CTransitManager:RecvData(dwAccountID,"CBuffSystem", lineData)
	return true;
end


CLoginCall:AddCall("CBuffSystem",func);



