

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    --从数据库中读取系统信息
    local data = {};
	local res = tbInfoList[1];
    if #(res) > 0 then
		data[1] = res[1].records;
		data[2] = res[1].attrs;
		data[3] = res[1].totaltimes;
    else--if isNewRole then
        data[1] = "";
		data[2] = "";
		data[3] = 0;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("t_role_addattrs");
        SqlCmd.Fields.roleid	= dwRoleID;
        SqlCmd.Fields.records	= "";
        SqlCmd.Fields.attrs		= "";
		SqlCmd.Fields.totaltimes= 0;
        SqlCmd:execute();
    end;
	CTransitManager:RecvData(dwAccountID,"CAddAttrSystem", data);
	
	return true;
end;


CLoginCall:AddCall("CAddAttrSystem", func);



