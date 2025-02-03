

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local tabData = tbInfoList[1] or {}
	CTransitManager:RecvData(dwAccountID,"CEvaluateSystem",tabData[1])
	return true;
end


CLoginCall:AddCall("CEvaluateSystem",func);



