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
--Update �ȼ�������
function CTieBuShanSystemDB:UpdateData(dwRoleId, level, exps)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwClothLevel = level;    --�ȼ�
	SqlCmd.Fields.dwClothExp = math.ceil(exps);      --����
	SqlCmd:execute();
end;
--Update ����ֵ
function CTieBuShanSystemDB:UpdateForbidValue(dwRoleId, dwForbidValue)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwForbidValue = math.ceil(dwForbidValue);   --����ֵ
	SqlCmd:execute()
end;
--Update ��װ�ȼ�
function CTieBuShanSystemDB:UpdateSuitLevel(dwRoleId, dwSuitLevel)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Iron_Cloth_Info')
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwSuitLevel = dwSuitLevel;      --��װ�ȼ�
	SqlCmd:execute()
end;

