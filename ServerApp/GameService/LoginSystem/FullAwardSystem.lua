--[[
	³äÖµ½±ÀøÏµÍ³
	ÇúÓ¨
	2013-06-11
]]

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1[1];
    else--if isNewRole then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_Full_Award');
		SqlCmd.Fields.dwRoleId				= dwRoleID;
		SqlCmd.Fields.dwAccountId			= dwAccountID;
		SqlCmd:execute()
		local tbl = {};
		tbl.dwAddiAwardPhase = 0;   
		tbl.dwPerAwardPhase = 0;    
		table.insert(tabData, tbl);
    end;
	table.insert(lineData, tabData);
	CTransitManager:RecvData(dwAccountID,"CFullAwardSys", lineData);
	return true;
end

CLoginCall:AddCall("CFullAwardSys",func);



