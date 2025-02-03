--[[
	修城墙系统
	曲莹
	2013-04-26
]]

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local lineData = {};
    local tabData = {};
    local dbres1 = tbInfoList[1];
    if #(dbres1) > 0 then
		tabData = dbres1;
    else--if isNewRole then
		--objPlayer:GetDBQuery():execute('insert into "T_Build_Rampart_Info" ("dwRoleId", "strRoleName") values($1, $2)', dwRoleID, szRoleName);
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Build_Rampart_Info');
		SqlCmd.Fields.dwRoleId				= dwRoleID;
		SqlCmd.Fields.strRoleName			= objPlayer:GetName();
		SqlCmd:execute()
		
		local tbl = {};
		tbl.dwLabourValue = 0;   --劳力
		tbl.dwWoodValue = 0;        --木材
		tbl.dwStoneValue = 0;      --石材
		tbl.dwState = 1;           --修建的阶段
		tbl.dwStateFlag = false;   --领取奖励的状态
		tbl.dwDiploidExp = false; --领取双倍奖励的状态
		tbl.strGetAward = "";   --已领取奖励
		tbl.dwLabourCD = 0;     --劳力CD
		tbl.dwWoodCD = 0;         --木材CD
		tbl.dwStoneCD = 0;        --石料CD
		tbl.dwContriValue = 0;  
		table.insert(tabData, tbl);
    end;
  
	table.insert(lineData, tabData);
	CTransitManager:RecvData(dwAccountID,"CBuildRampartSystem", lineData);
	return true;
end

CLoginCall:AddCall("CBuildRampartSystem",func);



