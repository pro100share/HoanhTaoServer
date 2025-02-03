
local function func(objPlayer,tbInfoList)
	local tabData = {};
	for k,v in pairs(tbInfoList[1]) do
		local tabTemp = {};
		tabTemp.dwShow = v.dwShow;
		tabTemp.dwUpdate = v.dwUpdate;
		tabData[v.dwTitleID] = tabTemp;
	end

	local dwAccountID = objPlayer:GetAccountID();
	CTransitManager:RecvData(dwAccountID,"CTitleSystem",tabData);
	return true;
end

CLoginDataManager:AddDataFunc("CTitleSystem",func);



