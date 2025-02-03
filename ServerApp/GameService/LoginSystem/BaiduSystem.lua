
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	--从数据库中读取系统信息
	local strall = "";
	local res1 = tbInfoList[1]
	if #(res1) > 0 then
		strall = res1[1].szParam;
	else
		strall = "";
		
		local strformat = "%d,0;";
		for k,v in pairs(BaiduType)do
			local str1 = string.format(strformat, v);
			strall = strall..str1;
		end
		
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Baidu");
		SqlCmd.Fields.dwRoleID		= dwRoleID;
		SqlCmd.Fields.szParam		= strall;
		SqlCmd:execute();
	end;
	
	local data = {};
	data[1] = strall;
	CTransitManager:RecvData(dwAccountID,"CBaiduSystem", data);
	return true;
end;


CLoginCall:AddCall("CBaiduSystem",func);
