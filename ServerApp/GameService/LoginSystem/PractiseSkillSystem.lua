
local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local tabData = {};
    local dbres = tbInfoList[1]
    if #(dbres) > 0 then
		tabData = dbres;
	end;
	-- print("============tabData================",#tabData)
    CTransitManager:RecvData(dwAccountID,"CPractiseSkillSystem",tabData);
    return true;
end;


CLoginCall:AddCall("CPractiseSkillSystem",func);