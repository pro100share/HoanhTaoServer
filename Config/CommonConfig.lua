
---------------公共配置--------------------

--一组数字打包成字符	  --无需配置
_G.fPackSZNumData = function(tNum)
	if type(tNum) ~= "table" then return nil end;
	if #tNum == 0 then return nil end;
	
	local szData = '@'
	
	for _,v in ipairs(tNum) do 
		szData = szData..'%s#'
		szData = string.format(szData,v)
	end

	return szData;
end

--一组字符数字解析		--无需配置
_G.fParseSZNumData = function(szDescribe)
	if type(szDescribe) ~= "string" then return nil end;
	local tNum = {}
	local dwStart = string.find(szDescribe,'@');
	if not dwStart then return nil end;
	
	local dwIndex = dwStart;
	
	while(dwIndex < string.len(szDescribe)) do
		if string.sub(szDescribe,dwIndex+1,dwIndex+1) == '#' then
			local szTemp = string.sub(szDescribe,dwStart+1,dwIndex)
			local dwtemp = tonumber(szTemp);
			if dwtemp then 
				table.insert(tNum,dwtemp);
			end
			dwStart = dwIndex + 1;
		end
		dwIndex = dwIndex + 1;
	end
	return tNum;
end

--A表是否包含B表（不做	相同元素区分及下标区分） 	--无需配置
_G.fIsTACompriseTB = function(tA,tB)
	if type(tA) ~= "table" then return nil end;
	if type(tB) ~= "table" then return nil end;
	if #tB == 0 then return true end;
	local Num = 0;
	for _,bv in pairs(tB) do
		for __,av in pairs(tA) do
			if av == bv then
				Num = Num + 1;
				break;
			end
		end
	end
	return Num == #tB
end
