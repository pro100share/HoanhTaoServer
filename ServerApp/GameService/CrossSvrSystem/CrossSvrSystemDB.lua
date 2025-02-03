_G.CCrossSvrSystemDB = {}
function CCrossSvrSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CCrossSvrSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
function CCrossSvrSystemDB:UpdateHonor(dwRoleId, dwValue)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Cross_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwHonor = dwValue;    --»Ÿ”˛÷µ
	SqlCmd:execute()
end;