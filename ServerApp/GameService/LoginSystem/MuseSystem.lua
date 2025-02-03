

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();

	local Data = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_Muse" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
	if #(dbres) > 0 then
		Data[1] = dbres[1].dwMuseBegin;
		Data[2] = dbres[1].dwBeInjectCount;
		Data[3] = dbres[1].dwAddMuseCount;
		Data[4] = dbres[1].dwMyInjectExpCount;
		Data[5] = dbres[1].dwGiftCount;
	else--if isNewRole then
		Data[1] = _now();
		Data[2] = 0;
		Data[3] = 0;
		Data[4] = 0;
		Data[5] = 0;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Muse");
		SqlCmd.Fields.dwRoleID       	= dwRoleID;
		SqlCmd.Fields.dwMuseBegin		= Data[1];
		SqlCmd.Fields.dwBeInjectCount	= 0;
		SqlCmd.Fields.dwAddMuseCount	= 0;
		SqlCmd.Fields.dwMyInjectExpCount	= 0;
		SqlCmd.Fields.dwGiftCount		= 0;
		SqlCmd:execute();
	end;
	
	local tbLog = {};
	local tb = tbInfoList[2]
	for k,v in pairs(tb)do
		local temp = {};
		temp.dwRoleID = v.dwInjectID;
		temp.dwTime = v.dwTime;
		temp.szRoleName = v.szRoleName;
		
		table.insert(tbLog,temp);
	end
	
	local infotable = {};
	infotable[1] = Data;
	infotable[2] = tbLog;
	
	CTransitManager:RecvData(dwAccountID,"CMuseSystem", infotable);
	return true;
end;


CLoginCall:AddCall("CMuseSystem",func);



