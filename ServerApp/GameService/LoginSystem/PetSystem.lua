
local function UpdateStr(str)
	local strResult = ""
	for i = 1,#str do
		 strResult =  strResult..str[i]..";"
	end
	return strResult
end;


local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local tabData = {};
	tabData[1] = {}
	local dbres = tbInfoList[1];
	if #(dbres) > 0 then
		local index = 1;
		while(dbres[index]) do
			local tempRes = dbres[index]
			
			local tempTab = {};
			tempTab.dwRoleId = tempRes.dwRoleId;
			tempTab.dwPetId = tempRes.dwPetId;
			tempTab.dwLevel = tempRes.dwLevel;
			tempTab.dwExp = tempRes.dwExp;
			tempTab.dwState = tempRes.dwState;
			tempTab.dwDayConsult = tempRes.dwDayConsult;
			tempTab.dwConsult = tempRes.dwConsult;
			tempTab.dwDayImpart = tempRes.dwDayImpart;
			tempTab.dwAllImpart = tempRes.dwAllImpart;
			tempTab.dwHP = tempRes.dwHp;
			tempTab.dwLastDieTime = tempRes.dwLastDieTime;
			tempTab.dwFper = tempRes.dwFper;
			
			table.insert(tabData[1], tempTab);
			index = index + 1;
		end
    end;
    
	-----³èÎï¼¼ÄÜ
	tabData[2] = {}
	tabData[3] = {}
	local dbres1 = tbInfoList[2];
	if #(dbres1) > 0 then
		tabData[2] = dbres1[1];
    end
    local dbres2 = tbInfoList[3];
	if #(dbres2) > 0 then
		for k,row in pairs(dbres2) do
			tabData[3][k] = row;
		end
    end
	--print("tabData[3]tabData[3]tabData[3]tabData[3]")
	--table.print(tabData[3])
	CTransitManager:RecvData(dwAccountID,"CPetSystem",tabData)
	return true;
end
CLoginDataManager:AddDataFunc("CPetSystem",func);