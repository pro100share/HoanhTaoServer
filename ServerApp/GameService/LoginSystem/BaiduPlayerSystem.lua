
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	--从数据库中读取系统信息
	local res1 = tbInfoList[1]
	
	if #res1<1 then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_BaiduPlayer");
		SqlCmd.Fields.dwRoleID		= dwRoleID;
		SqlCmd:execute();
	end;
	
	local data = {};
	data = res1[1];
	CTransitManager:RecvData(dwAccountID,"CBaiduPlayerSystem", data);
	return true;
end;


CLoginCall:AddCall("CBaiduPlayerSystem",func);
