--[[
功能：引入收集功能相关的LUA文件（服务器）
作者：周长沙
时间：2013-1-22
]]

_G.CCollectSystemDB = {}
local dbTableName = "T_Role_Collect"
------------------------------------------
------------------------------------------
function CCollectSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	for i, v in pairs(CCollectSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end
-------------------------------------------------------------------------------------------------------
--插入一条信息
function CCollectSystemDB:AddInfo(Pack)
	local SqlCmd = self.objDBQuery:CreateInsertCmd(dbTableName);
	SqlCmd.Fields = Pack;
	SqlCmd:execute()
	return true;
end
--更新一条信息
function CCollectSystemDB:UpdateInfo(Pack)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CCollectSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.dwRoleID = Pack.dwRoleID;
	SqlCmd.Wheres.dwPageID = Pack.dwPageID;
	SqlCmd.Wheres.dwSeriesID = Pack.dwSeriesID;
	SqlCmd.Fields = Pack;
	SqlCmd:execute();
	return true;
end





