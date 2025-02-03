
local function func(oPlayer, tInfoList, bNewRole)
	local tTemp = {};
	local tDBRes = tInfoList[1]
    if #(tDBRes) > 0 then
		local tRow = tDBRes[1];
		for k, v in pairs(tRow) do
			tTemp[k] = v;
		end
    end
	CTransitManager:RecvData(oPlayer:GetAccountID(), "CHeroTokenSystem", {
		tEnbeded = _G.HeroTokenFunctions.StringToTable(tTemp.szEnbeded)});
	return true;
end

CLoginCall:AddCall( "CHeroTokenSystem", func );
