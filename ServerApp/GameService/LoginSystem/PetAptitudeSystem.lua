local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();	
	local tabData = {};
	local dbres = tbInfoList[1];
	if #(dbres) > 0 then
		tabData[1] = {}
		for k,row in pairs(dbres) do
			tabData[1][row.dwPetEnumId] = {};
			tabData[1][row.dwPetEnumId].dwMp = row.dwMp;   --����
			tabData[1][row.dwPetEnumId].dwAttack = row.dwAttack; --����
			tabData[1][row.dwPetEnumId].dwDefense = row.dwDefense;  --����
			tabData[1][row.dwPetEnumId].dwCrit = row.dwCrit;  --����
			tabData[1][row.dwPetEnumId].dwFlee = row.dwFlee;  --��
		end
    end
   
	CTransitManager:RecvData(dwAccountID,"CPetAptitudeSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CPetAptitudeSystem",func);