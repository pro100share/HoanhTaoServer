

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
    local dbres = tbInfoList[1]
    if #(dbres) > 0 then
		tabData = dbres;
	end;
    CTransitManager:RecvData(dwAccountID,"CHiddenWeaponSystem",tabData);
    return true;
end;


CLoginCall:AddCall("CHiddenWeaponSystem",func);