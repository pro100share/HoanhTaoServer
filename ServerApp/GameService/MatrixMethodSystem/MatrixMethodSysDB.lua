--[[
功能：阵法系统数据库类
作者：魏云
时间：2013-10-29
--]]

_G.CMatrixMethodSystemDB = {}
function CMatrixMethodSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CMatrixMethodSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CMatrixMethodSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CMatrixMethodSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CMatrixMethodSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CMatrixMethodSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CMatrixMethodSystemDB");
		return false;
	end;
	return true;
end;
----更新数据库
function CMatrixMethodSystemDB:UpdateDBMatrixMethod()
	local flag = self:UsualMethod();
	if not flag then
		return; 
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_MatrixMethod');
	SqlCmd.Wheres.dwRoleID = self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.dwOrdinaryStarTotalExp = self.m_ObjSys.ResData.dwOrdinaryStarTotalExp;  
	SqlCmd.Fields.dwSuitStarLevel = self.m_ObjSys.ResData.dwSuitStarLevel; 
	SqlCmd.Fields.dwHideStarLevel = self.m_ObjSys.ResData.dwHideStarLevel;
	SqlCmd.Fields.dwUsedFreeNum = self.m_ObjSys.ResData.dwUsedFreeNum;
	SqlCmd:execute();
end

----插入数据库
function CMatrixMethodSystemDB:InsertDBMatrixMethod()
	local flag = self:UsualMethod();
	if not flag then
		return; 
	end
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_MatrixMethod');
	SqlCmd.Wheres.dwRoleID = self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.dwOrdinaryStarTotalExp = self.m_ObjSys.ResData.dwOrdinaryStarTotalExp;  
	SqlCmd.Fields.dwSuitStarLevel = self.m_ObjSys.ResData.dwSuitStarLevel; 
	SqlCmd.Fields.dwHideStarLevel = self.m_ObjSys.ResData.dwHideStarLevel;
	SqlCmd.Fields.dwUsedFreeNum = self.m_ObjSys.ResData.dwUsedFreeNum;
	SqlCmd:execute();
end
