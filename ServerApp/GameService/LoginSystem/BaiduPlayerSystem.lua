
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	--�����ݿ��ж�ȡϵͳ��Ϣ
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
