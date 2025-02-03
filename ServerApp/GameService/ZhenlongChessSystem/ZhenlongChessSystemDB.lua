--[[
功能：挑战群侠系统数据库操作
版本：
	v1.0	2013-11-1 create by lizc
]]

_G.CZhenlongChessDB = {};

function CZhenlongChessDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CZhenlongChessDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--检查系统数据库模块有效性
function CZhenlongChessDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CZhenlongChessDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CZhenlongChessDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CZhenlongChessDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CZhenlongChessDB");
		return false;
	end;
	return true, dwRoleID;
end;
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------珍珑棋局系统信息相关--------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--插入珍珑棋局系统信息
function CZhenlongChessDB:InsertSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CZhenlongChessDB:InsertSysInfo");
		return false;
	end;
	
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_ZhenlongChess");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.curProcess		= db_Info.curProcess;
	SqlCmd.Fields.curTotalCount		= db_Info.curTotalCount;
	SqlCmd.Fields.setBossCount 		= db_Info.setBossCount;
	SqlCmd.Fields.setBossStar		= db_Info.setBossStar;
	SqlCmd.Fields.tabGetAward 		= db_Info.tabGetAward;
	SqlCmd:execute()
	return true;
end;

--更新珍珑棋局系统信息
function CZhenlongChessDB:UpdateSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CZhenlongChessDB:UpdateQunXiaSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_ZhenlongChess");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.curProcess		= db_Info.curProcess;
	SqlCmd.Fields.curTotalCount		= db_Info.curTotalCount;
	SqlCmd.Fields.setBossCount 		= db_Info.setBossCount;
	SqlCmd.Fields.setBossStar		= db_Info.setBossStar;
	SqlCmd:execute()
	return true;
end;


function CZhenlongChessDB:UpdateStarAwardInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CZhenlongChessDB:UpdateQunXiaSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_ZhenlongChess");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.tabGetAward		= db_Info.tabGetAward;
	SqlCmd:execute()
	return true;
end
