--[[
���ܣ����ﾳ�����ݿ���
���ߣ����в�
ʱ�䣺2013-12-23
--]]

_G.CPetWashDB ={}
function CPetWashDB:new(objDB,objPetWash)
	local obj = {};
	obj.objDB = objDB;      --��Ӧ�����ݿ� 
	obj.objPetWash = objPetWash;
	
	for i, v in pairs(CPetWashDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end


--���ϵͳ���ݿ�ģ����Ч��
function CPetWashDB:CheckDBValidity()
	if not self.objDB then
		_info("self.objDB is null by CPetWashDB");
		return false;
	end;
	if not self.objPetWash then
		_info("self.objPetWash is null by CPetWashDB");
		return false;
	end;
	local objPlayer = self.objPetWash.petSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPetWashDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0  by CPetWashDB");
		return false;
	end;
	return true, dwRoleID;
end;
---------------------------------------------------------------------------------------------


---���� ����ϴ������
function CPetWashDB:UpdatePetAttr(petEnumID, szAttr)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end
	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetWash_Info');			
	SqlCmd.Wheres.dwRoleID			= roleId; 
	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.szAttr				= szAttr;
	SqlCmd:execute()
end



--���� ����ϴ������
function CPetWashDB:UpdatePetCount(petEnumID, dwCount)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end
	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetWash_Info');			
	SqlCmd.Wheres.dwRoleID			= roleId; 
	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.dwWashCount		= dwCount;
	SqlCmd:execute()
end

---���� ����װ����Ϣ
function CPetWashDB:InsertPetWashInfo(petEnumID, szAttr, dwCount)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end

	local SqlCmd = self.objDB:CreateInsertCmd('T_PetWash_Info');			
	SqlCmd.Fields.dwRoleID			= roleId; 
	SqlCmd.Fields.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.szAttr				= szAttr;
	SqlCmd.Fields.dwWashCount				= dwCount;
	SqlCmd:execute()
end
