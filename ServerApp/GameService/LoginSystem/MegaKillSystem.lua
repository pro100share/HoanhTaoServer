

local function DecodeStr(str)
	local tempT = {};
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		if not m then
			_err("----------------");
		end;
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if not key or not value then
			_err("!@#!$%%", str2, str3);
		end;
		tempT[key] = value;
	end;
	return tempT;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    --从数据库中读取系统信息
    local data = {};
	local res = tbInfoList[1];
    if #(res) > 0 then
		data[1] = res[1].dwSoulNum;
		data[2] = res[1].dwRandomNum;
		data[3] = res[1].dwBuyNum;
		data[4] = res[1].dwLevel;
		data[5] = DecodeStr(res[1].strAttrs);
		data[6] = DecodeStr(res[1].strKillRecord);
		data[7] = 0;
		data[8] = res[1].dwAptitude or 0 ;
		for k, v in pairs(data[6]) do
			data[7] = data[7] + v;
		end;
    else--if isNewRole then
        data[1] = 0;
		data[2] = _G.MegaKillConfig.RandomNum;
		data[3] = 0;
		data[4] = 1;
		data[5] = {};
		data[6] = {};
		data[7] = 0;
		data[8] = 0;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_MegaKill");
        SqlCmd.Fields.dwRoleID      = dwRoleID;
        SqlCmd.Fields.dwSoulNum		= data[1];
        SqlCmd.Fields.dwRandomNum	= data[2];
        SqlCmd.Fields.dwBuyNum		= data[3];
        SqlCmd.Fields.dwLevel		= data[4];
        SqlCmd.Fields.strAttrs		= "";
        SqlCmd.Fields.strKillRecord	= ""; 
		SqlCmd.Fields.dwAptitude	= data[8];
        SqlCmd:execute();
    end;
	CTransitManager:RecvData(dwAccountID,"CMegaKillSystem", data);
	
	return true;
end;


CLoginCall:AddCall("CMegaKillSystem", func);



