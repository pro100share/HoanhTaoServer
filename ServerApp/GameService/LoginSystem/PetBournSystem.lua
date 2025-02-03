
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	
	local dbres = tbInfoList[1];
	
	--print("CPetBournSystem DB  show table")
	--table.print(dbres)
	
	if #(dbres) > 0 then
		tabData[1] = {}
		for k,row in pairs(dbres) do
			tabData[1][row.dwPetEnumId] = row.dwExp;
		end
    end
   
	CTransitManager:RecvData(dwAccountID,"CPetBournSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CPetBournSystem",func);