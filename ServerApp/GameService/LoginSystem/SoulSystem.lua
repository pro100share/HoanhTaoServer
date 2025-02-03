
local function StringCut(str,strMode)
	local temp = {};
	local lastIndex = 0;
	
	while true do
		local nextIndex = lastIndex + 1;
		lastIndex = string.find(str, strMode, nextIndex)
		if not lastIndex then break end;
		local str1 = string.sub(str, nextIndex, lastIndex - 1);
		
		table.insert(temp,str1);
	end
	
	return temp;
end;

local function StringKeyValue(str,strMode)
	local lastIndex = string.find(str, strMode, 1)
	if not lastIndex then
		return nil;
	end;
	local str1 = string.sub(str, 1, lastIndex - 1);
	local str2 = string.sub(str, lastIndex+1);
	
	
	return str1,str2;
end;

local function UnpackActiveListString(szActList)
	local tbRsl = {};
	
	if not szActList then
		return tbRsl;
	end
	
	local tbFirst = StringCut(szActList,"|");
	for _,strSingle in pairs(tbFirst)do
		local key,value = StringKeyValue(strSingle,";");
		
		if key and value then
			key = tonumber(key);
			local tbSingleRsl = {};
			local tbList = StringCut(value,",");
			for k,v in pairs(tbList)do
				local dwTmp = tonumber(v);
				tbSingleRsl[dwTmp] = 1;
			end
			
			tbRsl[key] = tbSingleRsl;
		end
	end
	
	return tbRsl;
end;

local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
	
	local dwNextInstID = 0;
	local res2 = tbInfoList[2];
	local data2 = {};
	if #(res2) > 0 then
		for k,v in pairs(res2)do
			local tmp = 
			{
				[1] = v.dwEnumID;
				[2] = v.dwSoulID;
				[3] = v.dwHolderType;
				[4] = v.dwPosID;
				[5] = v.dwExp;
			};
			
			table.insert(data2,tmp);
			
			if dwNextInstID < v.dwSoulID then
				dwNextInstID = v.dwSoulID;
			end
		end
	end
	
	local data1 = {};
	local res1 = tbInfoList[1];
	if #(res1) > 0 then
		data1[1] = res1[1].dwPacketNumber;
		data1[2] = res1[1].dwClickIndex;
		data1[3] = res1[1].dwSoulChip;
		
		data1[5] = UnpackActiveListString(res1[1].strActiveSuit)
		
	else--if isNewRole then
		data1[1] = SoulSystem.InitPacketNumber;
		data1[2] = 0;
		data1[3] = 0;
		data1[5] = {};
		local SqlCmd = objPlayer:GetDBQuery():CreateInsertCmd("T_Role_Soul_System");
		SqlCmd.Fields.dwRoleID       	= dwRoleID;
		SqlCmd.Fields.dwPacketNumber	= data1[1];
		SqlCmd.Fields.dwClickIndex		= data1[2];
		SqlCmd.Fields.dwSoulChip		= data1[3];
		SqlCmd.Fields.strActiveSuit		= "";
		SqlCmd:execute();
	end;
	data1[4] = dwNextInstID;
	CTransitManager:RecvData(dwAccountID,"CSoulSystem", data1);
	
	CTransitManager:RecvData(dwAccountID,"CSoulSystem", data2);
	
	return true;
end;


CLoginCall:AddCall("CSoulSystem",func);
