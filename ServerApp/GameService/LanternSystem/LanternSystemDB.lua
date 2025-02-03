--[[

]]

_G.CLanternSystemDB = {}
local dbTableName = "T_Role_Lantern"
----------------------------------------------------------------
function CLanternSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDBQuery = objDB;
	obj.objUser = objUser;   --对应的玩家
	setmetatable(obj,{__index=self})
	return obj;
end
-----------------------------------------------------------------
function CLanternSystemDB:Insert()
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CLanternSystemDB");
		return false;
	end;
	local dwRoleID = self.objUser:GetRoleID()
	local SqlCmd = self.objDBQuery:CreateInsertCmd(dbTableName);
	SqlCmd.Fields = {};
	SqlCmd.Fields.dwRoleID = dwRoleID
	SqlCmd:execute()
end

function CLanternSystemDB:Update(Info)
	if not self.objDBQuery then
		_info("self.objDBQuery is null by CLanternSystemDB");
		return false;
	end;
	local SqlCmd = self.objDBQuery:CreateUpdateCmd(dbTableName);
	SqlCmd.Wheres.dwRoleID = self.objUser:GetRoleID()
	SqlCmd.Fields = Info
	SqlCmd:execute()
	return true
end

























