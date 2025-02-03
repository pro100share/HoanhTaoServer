

local function func(objPlayer,tbInfoList,isNewRole)
	--print("KungFuSystem RecvData begin")
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_KungFu_Info" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
    if #(dbres) > 0 then
		local tempTab = {}
		for k, v in pairs(dbres) do
			tempTab[v.dwDressID]= {deleteTime = v.dwDeleteTime, bRenew = v.bRenew,bInBox = v.bInBox or false};
		end
	
		tabData[1] = tempTab;
    end
    
	
	local dbres2 = tbInfoList[2]
	if #(dbres2) > 0 then
		local tempTab = dbres2[1];
		tabData[2] = tempTab.dwExp;
		tabData[3] = tempTab.szEquip;
		tabData[4] = tempTab.dwBoxNum;
	end
	
	CTransitManager:RecvData(dwAccountID,"CFashionDressSystem", tabData);
	return true;
end


CLoginCall:AddCall("CFashionDressSystem", func);



