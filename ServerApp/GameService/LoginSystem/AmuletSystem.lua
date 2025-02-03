local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	
	local dbres = tbInfoList[1];
    
    if #dbres > 0 then
		tabData = 
		{
			dwAmuletGrowth = dbres[1].AmuletGrowth,
			dwAmuletLevel = dbres[1].AmuletLevel,
			dwAmuletRank =  dbres[1].AmuletRank,
			dwAmuletIntensifyPerConfig = dbres[1].AmuletIntensifyPerConfig,
			dwAmuletIntensifyColorConfig = dbres[1].AmuletIntensifyColorConfig,
			dwAmuletInlayLevel = dbres[1].AmuletInlayLevel,
            dwAptitude = dbres[1].Aptitude
		};
        if true then
        end
        if tabData.dwAmuletLevel == nil or tabData.dwAmuletRank == nil then
            _err("[AmuletSystem] Data error kill player");
            _closenet(objPlayer.objNet);
        end
    else
        local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Amulet');
		SqlCmd.Fields.RoleID				= dwRoleID;
		SqlCmd:execute()
		tabData = 
		{
			dwAmuletGrowth = 0,
			dwAmuletLevel = 1,
			dwAmuletRank =  1,
			dwAmuletIntensifyPerConfig = 1,
			dwAmuletIntensifyColorConfig = 1,
			dwAmuletInlayLevel = 0,
            dwAptitude = 0
		};
    end;

	CTransitManager:RecvData(dwAccountID,"CAmuletSystem",tabData)
	return true;
end

CLoginDataManager:AddDataFunc("CAmuletSystem",func);
