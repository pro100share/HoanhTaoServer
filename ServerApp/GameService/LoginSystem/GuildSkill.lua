

local function DecodeStr(str, t)
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
		t[key] = value;
	end;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local skillTable = {};
	for k, _ in pairs(_G.GuildSkillConfig) do
		skillTable[k] = 0;
	end;
	
	local res1 = tbInfoList[1]
    if #(res1) > 0 then
		DecodeStr(res1[1].szSkill, skillTable);
    else--if isNewRole then
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_GuildSkill");
        SqlCmd.Fields.dwRoleID  = dwRoleID;
        SqlCmd.Fields.szSkill	= "";
        SqlCmd:execute();
    end;
	CTransitManager:RecvData(dwAccountID,"CGuildSkill", skillTable);
	
	return true;
end;


CLoginCall:AddCall("CGuildSkill",func);



