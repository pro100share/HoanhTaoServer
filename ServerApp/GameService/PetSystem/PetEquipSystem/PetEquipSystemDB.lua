--[[
���ܣ�����װ�����ݿ���
���ߣ����в�
ʱ�䣺2013-11-12
--]]

_G.CPetEquipDB ={}
function CPetEquipDB:new(objDB,objPetEquip)
	local obj = {};
	obj.objDB = objDB;      --��Ӧ�����ݿ� 
	obj.objPetEquip = objPetEquip;
	
	for i, v in pairs(CPetEquipDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end


--���ϵͳ���ݿ�ģ����Ч��
function CPetEquipDB:CheckDBValidity()
	if not self.objDB then
		_info("self.objDB is null by CPetEquipDB");
		return false;
	end;
	if not self.objPetEquip then
		_info("self.objPetEquip is null by CPetEquipDB");
		return false;
	end;
	local objPlayer = self.objPetEquip.petSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CPetEquipDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0  by CPetEquipDB");
		return false;
	end;
	return true, dwRoleID;
end;
---------------------------------------------------------------------------------------------


---���� ����װ��
function CPetEquipDB:UpdatePetEquip(petEnumID, equipStr)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end
	local SqlCmd = self.objDB:CreateUpdateCmd('T_PetEquip_Info');			
	SqlCmd.Wheres.dwRoleID			= roleId; 
	SqlCmd.Wheres.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.szPetEquip		= equipStr;
	SqlCmd:execute()
end


---���� ����װ����Ϣ
function CPetEquipDB:InsertPetEquip(petEnumID, equipStr)
	local isValide, roleId = self:CheckDBValidity();
	if not isValide then
		return false;
	end

	local SqlCmd = self.objDB:CreateInsertCmd('T_PetEquip_Info');			
	SqlCmd.Fields.dwRoleID			= roleId; 
	SqlCmd.Fields.dwPetEnumId		= petEnumID;		
	SqlCmd.Fields.szPetEquip		= equipStr;
	
	SqlCmd:execute()
end
