

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    local Data = tbInfoList[1] or {}
   
    CTransitManager:RecvData(dwAccountID,"CScriptSystemCharge",Data)
	return true;
end;


CLoginCall:AddCall("CScriptSystem",func);



