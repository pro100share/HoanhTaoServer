--解析杀怪信息
local function ParseStr(str)
	local lastIndex = 0;
	local t = {};
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local index, index1 = string.find(str1, ",");
		local str2 = string.sub(str1, 0, index -1);
		local str3 = string.sub(str1, index1 + 1, index1 + 2);
		local key = tonumber(str2);
		local value = tonumber(str3);
		t[key] = value;	
	end;
	return t;
end;

local function ParseTblToStr(tbl)
	local str = "";
	if tbl then
		for monsterId, value in pairs(tbl) do
			str = str..monsterId..","..value..";";
		end;
	end;
	return str;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1;
		local a = {};
		for index, info in pairs(dbres1) do
			a[info.dwMapId] = index;
		end;
		--增加地图数据
		for dwMapId, infoTbl in pairs(_G.ErrantMonsterConfig) do
			if not a[dwMapId] then
				local monsterInfo = "";
				for dwMonsterId, _ in pairs(infoTbl) do
					monsterInfo = monsterInfo..dwMonsterId..",".."0"..";";
				end;
				local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Errant_Info');
				SqlCmd.Fields.dwRoleId			= dwRoleID;
				SqlCmd.Fields.dwMapId			= dwMapId;
				SqlCmd.Fields.szKillMonster	    = monsterInfo;
				SqlCmd:execute();
				local tbl = {};
				tbl.dwMapId = dwMapId;               
				tbl.szKillMonster = monsterInfo;  
				table.insert(tabData, tbl);
			end;
		end;
		--删除地图数据
		for dwMapId, _ in pairs(a) do
			if not _G.ErrantMonsterConfig[dwMapId] then
				local SqlCmd = objPlayer:GetDBQuery():CreateDeleteCmd('T_Errant_Info');
				SqlCmd.Wheres.dwRoleId = dwRoleID;
				SqlCmd.Wheres.dwMapId = dwMapId;
				SqlCmd:execute();
				table.remove(tabData, _);
			end;
		end;
		
		for _, Info in pairs(tabData) do
			local updateFlag = false;
			local dwMapId = Info.dwMapId;
			local szKillInfo = Info.szKillMonster;
			local tbl = ParseStr(szKillInfo);
			for dwMonsterId, _ in pairs(tbl) do
				if not _G.ErrantMonsterConfig[dwMapId][dwMonsterId] then
					tbl[dwMonsterId] = nil;
					updateFlag = true;
				end;
			end;
			for dwMonsterID, _ in pairs(_G.ErrantMonsterConfig[dwMapId]) do
				if not tbl[dwMonsterID] then
					tbl[dwMonsterID] = 0;
					updateFlag = true; 
				end;
			end;
			if updateFlag then
				local str = ParseTblToStr(tbl);
				local SqlCmd = objPlayer:GetDBQuery():CreateUpdateCmd('T_Errant_Info');
				SqlCmd.Fields.szKillMonster	    = str;
				SqlCmd.Wheres.dwRoleId			= dwRoleID;
				SqlCmd.Wheres.dwMapId			= dwMapId;	
				SqlCmd:execute();
				Info.szKillMonster = str;
			end;
		end;
    else
		for dwMapId, infoTbl in pairs(_G.ErrantMonsterConfig) do
			local monsterInfo = "";
			for dwMonsterId, _ in pairs(infoTbl) do
				monsterInfo = monsterInfo..dwMonsterId..",".."0"..";";
			end;
			local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Errant_Info');
			SqlCmd.Fields.dwRoleId			= dwRoleID;
			SqlCmd.Fields.dwMapId			= dwMapId;
			SqlCmd.Fields.szKillMonster	    = monsterInfo;
			SqlCmd:execute();
			
			local tbl = {};
			tbl.dwMapId = dwMapId;               
			tbl.szKillMonster = monsterInfo;      
			table.insert(tabData, tbl);
		end;
	end;
	
    local szErrantAward = "";
    local dbres2 = tbInfoList[2];
    if #(dbres2) > 0 then
		szErrantAward = dbres2[1].szErrantAward;
    else
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Errant_Award_Info');
		SqlCmd.Fields.dwRoleId = dwRoleID;
		SqlCmd:execute()
    end;
	
	table.insert(lineData, tabData);
	table.insert(lineData, szErrantAward);
	CTransitManager:RecvData(dwAccountID,"CErrantSystem", lineData);
	return true;
end;
CLoginCall:AddCall("CErrantSystem",func);
