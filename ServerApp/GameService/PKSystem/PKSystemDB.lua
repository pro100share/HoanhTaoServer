--[[
功能：PK系统的数据库操作
作者：刘炜
时间：2012-2-16
]]
_G.CPKSystemDB = {}
--创建
function CPKSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDB = objDB;
	obj.objUser = objUser;
	
	for n,v in pairs(CPKSystemDB)do
		if type(v) == "function" then
			obj[n] = v;
		end
	end
	return obj;
end;

--写入PK模式
function CPKSystemDB:WritePKMode(dwPKMode)
	if not self.objDB then
		_info("self.objDB is null by CPKSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPKSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPKSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPKSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Plus_Info');
	
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwPKMode = dwPKMode;
	SqlCmd.Fields.dwPKValue = 0;
	SqlCmd:execute();
	return true;
end;

--保存
function CPKSystemDB:SavePKMode(dwPKMode,dwPKValue)
	if not self.objDB then
		_info("self.objDB is null by CPKSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPKSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPKSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPKSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Plus_Info');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwPKMode = dwPKMode or 0;
	SqlCmd.Fields.dwPKValue = dwPKValue or 0;
	SqlCmd:execute()
end;

function CPKSystemDB:SaveSetMode(dwMode)
	if not self.objDB then
		_info("self.objDB is null by CPKSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CPKSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPKSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPKSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Plus_Info');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwMuseBegin = dwMode or 0;
	SqlCmd:execute()
end;
