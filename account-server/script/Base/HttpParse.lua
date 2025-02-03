local base = _G;

local PraseStrToArray;
local GetValue;

PraseStrToArray = function (szStr)
	local arrRes = {};
	local nStrLen = string.len(szStr);
	print("Data In:"..szStr);
	local nStartPos = 0;
	local i = 1;
	while nStartPos < nStrLen do
		local nFliedEnd = string.find(szStr,"&",nStartPos); 
		local szField ;
		print("So Lan: ".. i);
		i = i + 1;
		if not nFliedEnd then
			szField = string.sub(szStr,nStartPos,string.len(szStr));
			if not szField then
				break;
			end;
			local szName = string.sub(szField,0,string.find(szField,"=")-1);
			print("Name: ".. szName);
			local szValue = string.sub(szField,string.find(szField,"=")+1,string.len(szField));
			print(szName.." : ".. szValue);
			arrRes[szName] = GetValue(szValue);
			break;
		else
			szField = string.sub(szStr,nStartPos,nFliedEnd-1);
			nStartPos = nFliedEnd+1;
			local szName = string.sub(szField,0,string.find(szField,"=")-1);
			print("Name: ".. szName);
			local szValue = string.sub(szField,string.find(szField,"=")+1,string.len(szField));
			print(szName.." : ".. szValue);
			arrRes[szName] = GetValue(szValue);
		end;
	end;
	return arrRes;
end

GetValue = function (strValue)
	if not strValue then
		return "";
	end
	local value;
	if string.sub(strValue, 1, 1) == "{" then
		value = base.json.decode(strValue);
	elseif string.find(strValue, ",", 1) then
		local dwStart = 1;
		local dwEnd = string.find(strValue, ",", dwStart);
		value = {};
		while(dwEnd) do
			table.insert(value, string.sub(strValue, dwStart, dwEnd - 1));
			dwStart = dwEnd + 1;
			dwEnd = string.find(strValue, ",", dwStart);
		end
		table.insert(value, string.sub(strValue, dwStart, string.len(strValue)));
	else
		value = strValue;
	end
	return value;
end

_G.PraseStrToArray = PraseStrToArray;