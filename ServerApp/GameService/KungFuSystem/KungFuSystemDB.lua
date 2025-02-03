--[[
功能：功法系统数据库操作
版本：
	v1.0	2012-04-10 create by lkj
]]

_G.CKungFuSystemDB = {};

function CKungFuSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CKungFuSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CKungFuSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CKungFuSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CKungFuSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CKungFuSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CKungFuSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------玩家功法系统信息相关--------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--插入玩家功法系统信息
function CKungFuSystemDB:InsertKungFuSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CKungFuSystemDB:UpdateKungFuSysInfo");
		return false;
	end;
	
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_KungFu_Info");
	SqlCmd.Fields.n_RoleID			= RoleID;
	SqlCmd.Fields.s_StudyProcess 	= db_Info.s_StudyProcess;
	SqlCmd:execute()
	return true;
end;

--更新玩家功法系统信息
function CKungFuSystemDB:UpdateKungFuSysInfo(info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CKungFuSystemDB:UpdateKungFuSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_KungFu_Info");
	SqlCmd.Wheres.n_RoleID			= RoleID;
	SqlCmd.Fields.s_StudyProcess	= info.s_StudyProcess;
	SqlCmd:execute()
	return true;
end;