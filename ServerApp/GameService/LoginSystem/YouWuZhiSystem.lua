
--本地函数
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function SplitToNumber(szFullString, szSeparator)
	local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}
	while true do
	   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
	   if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
			break
	   end
	   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
	   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
	   nSplitIndex = nSplitIndex + 1
	end
	
	for i,v in pairs(nSplitArray) do
		nSplitArray[i]=tonumber(v);
	end
	return nSplitArray
end


local function func(objPlayer,tbInfoList,isNewRole)
	local dwAccountID = objPlayer:GetAccountID();
	local dwRoleID = objPlayer:GetRoleID();
    local tabData = tbInfoList[1];
	
	--dump_table(tabData);
	
	local tempObj={}
	for k,v in pairs(tbInfoList[1]) do
		if type(v.ImageData)=="string" then
			if(v.ImageData=="") then
				v.ImageData={}
			else
				v.ImageData=SplitToNumber(v.ImageData,",");
			end;
		end
		tempObj[v.dwImageID]=v;
		-- print(v.dwImageID);
	end
	local objDB=objPlayer:GetDBQuery();
	--dump_table(tbInfoList[1]);
	-- print("-------------",#StunnerConfig)
	--dump_table(tempObj);
	-- print("-------------",#StunnerConfig)
	for i,v in ipairs(StunnerConfig) do
		if not tempObj[i] then
			tempObj[i]={
				dwRoleID=dwRoleID;
				dwImageID=i;
				ImageData={};			
			};
			local sqlCmd=objDB:CreateInsertCmd("T_Role_YWZ");
			sqlCmd.Fields.dwRoleID=dwRoleID;
			sqlCmd.Fields.dwImageID=i;
			sqlCmd.Fields.ImageData="";
			sqlCmd:execute();
		end
		
		if #tempObj[i].ImageData <#v.Items then
			for k=#tempObj[i].ImageData+1,#v.Items do
				table.insert(tempObj[i].ImageData,0);
			end
		end
	end
	
	--dump_table(tempObj);
	
	tabData=tempObj;	
    CTransitManager:RecvData(dwAccountID,"CYouWuZhiSystem",tabData);
    return true;
end;

CLoginCall:AddCall("CYouWuZhiSystem",func);



