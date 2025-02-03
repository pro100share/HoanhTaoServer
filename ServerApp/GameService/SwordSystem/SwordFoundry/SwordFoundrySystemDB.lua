
--[[
	名剑注灵数据库类
	魏云
	2013-10-17
]]

_G.CSwordFoundrySystemDB = {}
function CSwordFoundrySystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CSwordFoundrySystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

function CSwordFoundrySystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CSwordFoundrySystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CSwordFoundrySystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CSwordFoundrySystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CSwordFoundrySystemDB");
		return false;
	end;
	return true;
end;
----更新数据库
function CSwordFoundrySystemDB:UpdateDBSwordFoundry()
	local flag = self:UsualMethod();
	if not flag then
		return; 
	end
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_SwordFoundry');
	SqlCmd.Wheres.dwRoleID = self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.dwSwordEumeID = self.m_ObjSys.ResData.dwSwordEumeID;  
	SqlCmd.Fields.dwStartNum = self.m_ObjSys.ResData.dwStartNum; 
	SqlCmd.Fields.dwSkilledValue = self.m_ObjSys.ResData.dwSkilledValue;
	SqlCmd:execute();
end

----插入数据库
function CSwordFoundrySystemDB:InsertDBSwordFoundry()
	local flag = self:UsualMethod();
	if not flag then
		return; 
	end
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Role_SwordFoundry');
	SqlCmd.Wheres.dwRoleID = self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.dwSwordEumeID = self.m_ObjSys.ResData.dwSwordEumeID;  
	SqlCmd.Fields.dwStartNum = self.m_ObjSys.ResData.dwStartNum;    
	SqlCmd.Fields.dwSkilledValue = self.m_ObjSys.ResData.dwSkilledValue;
	SqlCmd:execute();
end