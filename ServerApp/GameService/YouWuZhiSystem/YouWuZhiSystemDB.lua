
--本地函数
--字符串切割，参数： 源字符串，切割符
--返回：切割后的表
local function Split(szFullString, szSeparator)
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
	return nSplitArray
end


local function join(tab,szSeparator)
	local szStr="";
	local tabLen=#tab;
	for i,v in ipairs(tab) do
		if szStr~="" then
			szStr=szStr..szSeparator..v
		else
			szStr=szStr..v
		end
	end
	return szStr;
end




_G.CYouWuZhiDB={};

function CYouWuZhiDB:new(objDB,objSys)
	local obj={};
	obj.objDB=objDB;
	obj.objSys=objSys;
	for k,v in pairs(self) do
		if(type(v)=="function") then
			obj[k]=v;
		end 
	end
	return obj;
end

function CYouWuZhiDB:Update(ImageID,ImageData)
	local sqlcmd=self.objDB:CreateUpdateCmd("T_Role_YWZ");
	local dwRoleID=self.objSys:GetPlayer():GetRoleID();
	
	--sqlcmd.Fields.dwRoleID=dwRoleID;
	--sqlcmd.Fields.dwImageID=ImageID;
	sqlcmd.Fields.ImageData=join(ImageData,",");
	
	sqlcmd.Wheres.dwRoleID=dwRoleID;
	sqlcmd.Wheres.dwImageID=ImageID;
	sqlcmd:execute();
end






