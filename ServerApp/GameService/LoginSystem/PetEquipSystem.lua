

local function ParseStr(str)
	local t = {}
	
	local lastIndex = 0;
	local nextIndex = 0;
	while true do
		nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ",", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local value = tonumber(str1);
		if not value then
			_err("!@#!$%%", str1);
		end;
		table.insert(t, value)
	end;
	
	return t;
end



local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	tabData[1] = {}
	local dbres = tbInfoList[1];
	
	--print("CPetEquipSystem DB  show table")
	--table.print(dbres)
	
	if #(dbres) > 0 then
		for k,row in pairs(dbres) do
			tabData[1][row.dwPetEnumId] = ParseStr(row.szPetEquip);
		end
    end
   
	CTransitManager:RecvData(dwAccountID,"CPetEquipSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CPetEquipSystem",func);