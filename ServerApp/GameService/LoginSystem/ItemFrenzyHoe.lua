

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	tabData[1] = {}
	tabData[2] = {}
	tabData[3] = {}
	local dbres = tbInfoList[1];
	if #(dbres) > 0 then
		for k,row in pairs(dbres) do
			tabData[1][k] = row;
		end
    end;
    local dbres1 = tbInfoList[2];
	if (type(dbres1) == "table") and (#(dbres1)> 0) then
		tabData[2] = dbres1[1];
	elseif isNewRole then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_FrenzyHoe");
		SqlCmd.Wheres.dwRoleId = dwRoleID; 
		SqlCmd.Fields.dwFrendNum = 0;
		SqlCmd.Fields.dwAwardItemId = 0;
		SqlCmd.Fields.dwIsGet = -1;
		SqlCmd.Fields.dwHoeItemId = 0;
		SqlCmd.Fields.dwAwardItemNum = 0;
		SqlCmd:execute();
	else
		return
    end;
	
	-- local dbres2 = tbInfoList[3];
	-- if #(dbres2) > 0 then
		-- for k,row in pairs(dbres2) do
			-- tabData[3][k] = row;
		-- end
    -- end;
	CTransitManager:RecvData(dwAccountID,"CFrenzyHoeSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CFrenzyHoeSystem",func);