

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    --获取是否被禁言的标记
	local dwBanStart,dwBanTime = 0, 0;
	local dbres = tbInfoList[1];
    if #(dbres) > 0 then
		dwBanStart  = dbres[1].dwBanStart;
        dwBanTime   = dbres[1].dwBanTime;
    end;

	local banmsg = { dwBanStart=dwBanStart, dwBanTime=dwBanTime };
	CTransitManager:RecvData(dwAccountID,"CChatSystem", banmsg);
	return true;
end;


CLoginCall:AddCall("CChatSystem",func);



