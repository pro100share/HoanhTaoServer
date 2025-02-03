_G.CPetSystemDB = {}
function CPetSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CPetSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CPetSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CPetSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CPetSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPetSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CPetSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;

function CPetSystemDB:InsertPetInfo(dwPetId, dwLevel)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_Pet_Info')   --insert
	SqlCmd.Fields.dwRoleId = dwRoleId;
	SqlCmd.Fields.dwPetId = dwPetId
	SqlCmd.Fields.dwLevel = dwLevel;
	SqlCmd.Fields.dwExp = 0;
	SqlCmd.Fields.dwState = 1;
	SqlCmd.Fields.dwDayConsult = 0;
	SqlCmd.Fields.dwConsult = 0;
	SqlCmd.Fields.dwDayImpart = 0;
	SqlCmd.Fields.dwAllImpart = 0;
	SqlCmd.Fields.dwHp = _G.PetFunctionConfig.GetMaxHp(dwPetId, dwLevel);
	SqlCmd.Fields.dwLastDieTime = 0;
	SqlCmd:execute();
end;

--���³���ָ�̴���
function CPetSystemDB:UpdatePetConsult(dwPetId, dwDayConsult, dwConsult)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwDayConsult = dwDayConsult
	SqlCmd.Fields.dwConsult = dwConsult;
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;

--���³��ﴫ������
function CPetSystemDB:UpdatePetImpart(dwPetId, dwDayImpart, dwAllImpart)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwDayImpart = dwDayImpart
	SqlCmd.Fields.dwAllImpart = dwAllImpart;
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;

--���³���״̬
function CPetSystemDB:UpdatePetState(dwPetId, dwState)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwState = dwState
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;


--���³���Ѫ��
function CPetSystemDB:UpdatePetHp(dwPetId, dwHp, dwLastDieTime)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwHp = dwHp;
	SqlCmd.Fields.dwLastDieTime = dwLastDieTime;
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;

--���³���ȼ�������
function CPetSystemDB:UpdatePetLevel(dwPetId, dwLevel, dwExp)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwLevel =  dwLevel;
	SqlCmd.Fields.dwExp = dwExp;
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;
----���³���ӳɰٷֱ�
function CPetSystemDB:UpdatePetFper(dwPetId, dwFper)
	local flag, dwRoleId = self:UsualMethod();
	if not flag then
		return; 
	end;
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Pet_Info')   --update
	SqlCmd.Fields.dwFper =  dwFper;
	SqlCmd.Wheres.dwRoleId = dwRoleId;
	SqlCmd.Wheres.dwPetId = dwPetId;
	SqlCmd:execute();
end;
