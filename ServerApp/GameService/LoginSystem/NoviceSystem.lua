

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_NoviceGuide_New" where "dwRoleID" = $1', dwRoleID)
	if #(dbres) > 0 then
		for _,v in pairs(dbres) do
            table.insert(tabData, v.dwGuideID)
        end
    end;
	
	CTransitManager:RecvData(dwAccountID,"CNoviceSystem", tabData)
	return true;
end;


CLoginCall:AddCall("CNoviceSystem", func);



