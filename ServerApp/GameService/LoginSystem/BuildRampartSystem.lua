--[[
	�޳�ǽϵͳ
	��Ө
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
		tbl.dwLabourValue = 0;   --����
		tbl.dwWoodValue = 0;        --ľ��
		tbl.dwStoneValue = 0;      --ʯ��
		tbl.dwState = 1;           --�޽��Ľ׶�
		tbl.dwStateFlag = false;   --��ȡ������״̬
		tbl.dwDiploidExp = false; --��ȡ˫��������״̬
		tbl.strGetAward = "";   --����ȡ����
		tbl.dwLabourCD = 0;     --����CD
		tbl.dwWoodCD = 0;         --ľ��CD
		tbl.dwStoneCD = 0;        --ʯ��CD
		tbl.dwContriValue = 0;  
		table.insert(tabData, tbl);
    end;
  
	table.insert(lineData, tabData);
	CTransitManager:RecvData(dwAccountID,"CBuildRampartSystem", lineData);
	return true;
end

CLoginCall:AddCall("CBuildRampartSystem",func);



