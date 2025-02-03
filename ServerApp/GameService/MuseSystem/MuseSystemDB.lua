--[[
功能：闭关系统的数据库操作
作者：刘炜
时间：2012-2-8
]]
_G.CMuseSystemDB = {}
--创建
function CMuseSystemDB:new(objDB,objUser)
	local obj = {};
	obj.objDB = objDB;
	obj.objUser = objUser;
	
	for n,v in pairs(CMuseSystemDB)do
		if type(v) == "function" then
			obj[n] = v;
		end
	end
	return obj;
end;

--写入闭关开始时间
function CMuseSystemDB:WriteMuseTime(dwTime)
	if not self.objDB then
		_info("self.objDB is null by CMuseSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMuseSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMuseSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMuseSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Muse');
	
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwMuseBegin = dwTime;
	
	SqlCmd:execute()
	return true;
end;

function CMuseSystemDB:SaveMuseTime(dwTime)
	if not self.objDB then
		_info("self.objDB is null by CMuseSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMuseSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMuseSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMuseSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Muse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwMuseBegin = dwTime or 0;
	SqlCmd.Fields.dwAddMuseCount = self.objUser.dwAddMuseCount;
	SqlCmd:execute()
end;

function CMuseSystemDB:SaveBeInject(tbInfo)
	if not self.objDB then
		_info("self.objDB is null by CMuseSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMuseSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMuseSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMuseSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Inject_Log');
	SqlCmd.Fields.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwInjectID = tbInfo.dwRoleID;
	SqlCmd.Fields.dwTime = tbInfo.dwTime;
	SqlCmd:execute()
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Muse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwBeInjectCount = self.objUser.dwBeInjectCount;
	SqlCmd.Fields.dwAddMuseCount = self.objUser.dwAddMuseCount;
	SqlCmd:execute()
end

function CMuseSystemDB:SaveMyInjectInfo()
	if not self.objDB then
		_info("self.objDB is null by CMuseSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMuseSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMuseSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMuseSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Muse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwMyInjectExpCount = self.objUser.dwMyInjectExp;
	SqlCmd:execute()
end;

function CMuseSystemDB:SaveGiftInfo()
	if not self.objDB then
		_info("self.objDB is null by CMuseSystemDB");
		return false;
	end;
	if not self.objUser then
		_info("self.objUser is null by CMuseSystemDB");
		return false;
	end;
	
	local objPlayer = self.objUser:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMuseSystemDB");
		return false;
	end;
	local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMuseSystemDB");
		return false;
	end;
	
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Muse');
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd.Fields.dwGiftCount = self.objUser.dwGiftCount;
	SqlCmd:execute()
end;

