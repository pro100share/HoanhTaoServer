

--将类似“1#23#345#”的字符串转换为value为1,23,345的table
local function GetFormat(szStr)
	local t = {};
	if szStr == 0 or szStr == '0' then
		return t
	end
	if szStr == nil or szStr == '' then
		return t;
	end
	local h,e;
	local tempStr = szStr;
	local paramStr;
	while true do
		h,e = string.find(tempStr,'&');
		if not h then
			break;
		end
		paramStr = string.sub(tempStr,1,h-1);
		local enum = tonumber(paramStr)
		t[enum] = enum
		tempStr = string.sub(tempStr,h+1,-1);
	end
	return t;
end

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {
        [1] = {};
        [2] = {};
        [3] = {};
    };
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_GrowupTarget" where "dwRoleID" = $1', dwRoleID);
    if #(dbres) > 0 then
		for k,v in pairs (dbres) do
			tabData[1][v.dwIndex] = GetFormat(v.setCanGet)
			tabData[2][v.dwIndex] = GetFormat(v.setHasGet)
		end

    end;
  
	CTransitManager:RecvData(dwAccountID,"CGrowupTargetSystem", tabData);
    return true;
end;


CLoginCall:AddCall("CGrowupTargetSystem",func);



