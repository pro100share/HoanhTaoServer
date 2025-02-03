local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();	
	local tabData = {};
	local dbres = tbInfoList[1];
	if #(dbres) > 0 then
		tabData[1] = {}
		for k,row in pairs(dbres) do
			tabData[1][row.dwPetEnumId] = {};
			tabData[1][row.dwPetEnumId].dwMp = row.dwMp;   --内力
			tabData[1][row.dwPetEnumId].dwAttack = row.dwAttack; --攻击
			tabData[1][row.dwPetEnumId].dwDefense = row.dwDefense;  --防御
			tabData[1][row.dwPetEnumId].dwCrit = row.dwCrit;  --暴击
			tabData[1][row.dwPetEnumId].dwFlee = row.dwFlee;  --身法
		end
    end
   
	CTransitManager:RecvData(dwAccountID,"CPetAptitudeSystem",tabData)
	return true;
end


CLoginDataManager:AddDataFunc("CPetAptitudeSystem",func);