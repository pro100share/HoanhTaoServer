

local function func(objPlayer,tbInfoList,isNewRole)
	--print("KungFuSystem RecvData begin")
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	local dbres = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_KungFuExtend" where "dwRoleID" = $1 LIMIT 1', dwRoleID);
    if #(dbres) > 0 then
		local Row = dbres[1];
		tabData[1] = Row;
		--print("KungFuSystem get data form DB, the data is "..tabData[1]);
    end
    
	CTransitManager:RecvData(dwAccountID,"CGoldenBodySystem", tabData);
	--print("KungFuSystem RecvData end")
	return true;
end


CLoginCall:AddCall("CGoldenBodySystem", func);



