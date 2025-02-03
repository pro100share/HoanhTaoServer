

local function ParseStr(str)
	local tempT = {};
	local lastIndex = 0;
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, ";", nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		local m = string.find(str1, ",", 1);
		if not m then
			_err("----------------");
		end;
		local str2 = string.sub(str1, 1, m - 1);
		local str3 = string.sub(str1, m + 1);
		local key = tonumber(str2);
		local value = tonumber(str3);
		if not key or not value then
			_err("!@#!$%%", str2, str3);
		end;
		table.insert(tempT, {key, value});
	end;
	return tempT;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
    --从数据库中读取系统信息
    local data1 = {};
	local res1 = tbInfoList[1]--objPlayer:GetDBQuery():execute('select * from "T_Role_ItemSystem" where "dwRoleID" = $1', dwRoleID);
    if #(res1) > 0 then
		data1[1] = res1[1].dwPacketSlotNum;
		data1[2] = res1[1].dwPacketMoney;
		data1[3] = res1[1].dwStorageSlotNum;
		data1[4] = res1[1].dwStorageMoney;
		data1[5] = res1[1].dwNextItemID;
		data1[6] = res1[1].dwBindGold;
    else--if isNewRole then
        data1[1] = _G.InitConfig.dwInitPacketSlotNum;
		data1[2] = _G.InitConfig.dwPackMoney;
		data1[3] = _G.InitConfig.dwInitStorageSlotNum;
		data1[4] = _G.InitConfig.dwStorageMoney;
		data1[5] = 1;
		data1[6] = _G.InitConfig.dwBindGold;
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_ItemSystem");
        SqlCmd.Fields.dwRoleID       	= dwRoleID;
        SqlCmd.Fields.dwPacketSlotNum	= data1[1];
        SqlCmd.Fields.dwPacketMoney		= data1[2];
        SqlCmd.Fields.dwStorageSlotNum	= data1[3];
        SqlCmd.Fields.dwStorageMoney	= data1[4];
        SqlCmd.Fields.dwNextItemID		= data1[5];
        SqlCmd.Fields.dwGold			= 0;
        SqlCmd.Fields.dwBindGold		= data1[6];
        SqlCmd:execute();
    end;
	CTransitManager:RecvData(dwAccountID,"CItemSystem", data1);
	
	--从数据库中读取普通道具信息
	local res2 = tbInfoList[2]--objPlayer:GetDBQuery():execute('select * from "T_Role_Item_Normal" where "dwRoleID" = $1', dwRoleID);
    if #(res2) > 0 then
		local index = 1;
		local data = {}
		while(res2[index]) do
			local res = res2[index];
			
			local tempT = {
				[1] = res.dwItemEnum;
				[2] = res.dwItemID;
				[3] = res.dwRoleID;
				[4] = res.dwItemNumber;
				[5] = math.floor(res.dwPosSlot / 10000);
				[6] = math.floor(res.dwPosSlot % 10000);
				[7] = res.dwBindType;
				[8] = res.dwBornTime;
				[9] = res.dwLifeTime;
				[10] = res.strDoodle;
			};
			table.insert(data, tempT);
			index = index + 1;
		end;

	
		CTransitManager:RecvData(dwAccountID,"CItemSystem", data);
    end;
	
	--从数据库中读取装备道具信息
	local res3 = tbInfoList[3]--objPlayer:GetDBQuery():execute('select * from "T_Role_Item_Equip" where "dwRoleID" = $1', dwRoleID);
    if #(res3) > 0 then
		local index = 1;

			local data = {}
			while(res3[index]) do
				local res = res3[index];
				local tempT = {
					[1] = res.dwItemEnum;
					[2] = res.dwItemID;
					[3] = res.dwRoleID;
					[4] = res.dwItemNumber;
					[5] = math.floor(res.dwPosSlot / 10000);
					[6] = math.floor(res.dwPosSlot % 10000);
					[7] = res.dwBindType;
					[8] = res.dwBornTime;
					[9] = res.dwLifeTime;
					[10] = res.strDoodle;
					[11] = res.dwEndure;
					[12] = res.dwStrongLevel;
					[13] = res.dwTianSheng;
					[14] = ParseStr(res.strPropertyInfo);
				};
				table.insert(data, tempT);
				index = index + 1;
			end;
			CTransitManager:RecvData(dwAccountID,"CItemSystem", data);
    end;
	
	return true;
end;


CLoginCall:AddCall("CItemSystem",func);



