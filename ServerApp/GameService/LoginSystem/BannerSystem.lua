
local function func(oPlayer, tInfoList, bNewRole)
	local tData = {};
	local tDBRes = tInfoList[1]
    if #(tDBRes) > 0 then
		local tRow = tDBRes[1];
		for k, v in pairs(tRow) do
			tData[k] = v;
		end
    end
	CTransitManager:RecvData(oPlayer:GetAccountID(), "CBannerSystem", tData);
	return true;
end

CLoginCall:AddCall( "CBannerSystem", func );
