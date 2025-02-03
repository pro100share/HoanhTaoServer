_G.CTieBuShanSystemDB = {}
function CTieBuShanSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CTieBuShanSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--Update 等级，经验
function CTieBuShanSystemDB:UpdateData(dwRoleId, level, exps)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwClothLevel = level;    --等级
	SqlCmd.Fields.dwClothExp = math.ceil(exps);      --经验
	SqlCmd:execute();
end;
--Update 霸体值
function CTieBuShanSystemDB:UpdateForbidValue(dwRoleId, dwForbidValue)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwForbidValue = math.ceil(dwForbidValue);   --霸体值
	SqlCmd:execute()
end;
--Update 套装等级
function CTieBuShanSystemDB:UpdateSuitLevel(dwRoleId, dwSuitLevel)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSuitLevel = dwSuitLevel;      --套装等级
	SqlCmd:execute()
end;

