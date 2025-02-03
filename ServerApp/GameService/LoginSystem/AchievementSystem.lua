
local function StringCut(str,strMode)
	local temp = {};
	local lastIndex = 0;
	
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, strMode, nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		
		table.insert(temp,tonumber(str1));
	end
	
	return temp;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local data = tbInfoList[1];
	
    local tabList = {}
	for k,v in pairs(data) do
		local tabData = {}
		if v.eState ~= -1 then
			tabData.eState = v.eState
		end
		if v.dwDate ~= -1 then
			tabData.dwDate = v.dwDate
		end
		tabData.dwProgress = v.dwProgress
		tabData.dwAchievementID = v.dwAchievementID
		if AchievementConfig[v.dwAchievementID] then
			tabList[v.dwAchievementID] = tabData
		else
			local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Role_Achievement_New');
			SqlCmd.Wheres.dwRoleID = dwRoleID;
			SqlCmd.Wheres.dwAchievementID = v.dwAchievementID;
			SqlCmd:execute();
		end
	end

	--fix
	for k,v in pairs(tabList) do
		local tabConfig = AchievementConfig[v.dwAchievementID]
		local dwLast = tabConfig.tabCondition.dwLast
		if dwLast then
			if (not tabList[dwLast]) or not(tabList[dwLast].eState) then
				local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Role_Achievement_New');
				SqlCmd.Wheres.dwRoleID = dwRoleID;
				SqlCmd.Wheres.dwAchievementID = v.dwAchievementID;
				SqlCmd:execute();
				tabList[k] = nil
			end
		end
	end
	
	local tabMedalData = {};
	local res = tbInfoList[2];
	if #res > 0 then
		tabMedalData.dwAchievePointPlus = res[1].dwAchievePointPlus;
		local strdb = res[1].strMedalList or "";
		tabMedalData.setActiveMedal = StringCut(strdb,",");
	else
		tabMedalData.dwAchievePointPlus = 0;
		tabMedalData.setActiveMedal = {};
		
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_AchieveMedal');
		SqlCmd.Fields.dwRoleID = dwRoleID;
		SqlCmd:execute();
	end
	
	CTransitManager:RecvData(dwAccountID,"CAchievementSystem",tabList)
	CTransitManager:RecvData(dwAccountID,"CAchievementSystem_Medal",tabMedalData)
end


CLoginDataManager:AddDataFunc("CAchievementSystem",func);



