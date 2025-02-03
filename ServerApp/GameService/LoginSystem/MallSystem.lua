

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tbLuckDraw = {};
	local dbres2 = tbInfoList[2]
	
	for k,v in pairs(dbres2)do
		local tbTemp = {};
		tbTemp.dwIndex = v.dwIndex;
		tbTemp.dwID = v.dwID;
		tbTemp.dwEnumID = v.dwEnumID;
		tbTemp.dwNumber = v.dwNumber;
		tbTemp.dwPriceType = v.dwPriceType;
		tbTemp.dwPrice = v.dwPrice;
		tbTemp.dwBindType = v.dwBindType;
		tbTemp.dwBuyFlag = v.dwBuyFlag;
		
		tbLuckDraw[tbTemp.dwIndex] = tbTemp;
	end
	
	--如果有某些index没有DB数据，就插入一个空的
	for k,v in pairs(MallDrawConfig.tbDiscount)do
		if not tbLuckDraw[k] then
			local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd('T_Role_LuckDraw');
			SqlCmd.Fields.dwRoleID				= dwRoleID;
			SqlCmd.Fields.dwIndex				= k;
			SqlCmd:execute();
		end
	end

	CTransitManager:RecvData(dwAccountID,"CMallSystem",tbLuckDraw);
	return true;
end


CLoginCall:AddCall("CMallSystem",func);