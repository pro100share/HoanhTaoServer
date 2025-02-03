--[[
	宠物资质系统
	曲莹
	2014-01-06
]]--

_G.CPetAptitudeSystemDB = {}
function CPetAptitudeSystemDB:new(objDB)
	local obj = {}
	obj.m_ObjDB = objDB;
	for i, v in pairs(CPetAptitudeSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--update T_PetAptitude_Info	
function CPetAptitudeSystemDB:UpdatePetAptitudeInfo(dwRoleID, dwPetEnumID, dwType, dwValue)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_PetAptitude_Info')
	SqlCmd.Fields[dwType] = dwValue;
	SqlCmd.Wheres.dwPetEnumId = dwPetEnumID;		
	SqlCmd.Wheres.dwRoleID = dwRoleID;
	SqlCmd:execute();
end;

--insert T_PetAptitude_Info	
function CPetAptitudeSystemDB:InsertPetAptitudeInfo(dwRoleID, dwPetEnumID)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd('T_PetAptitude_Info')
	SqlCmd.Fields.dwRoleID			= dwRoleID; 
	SqlCmd.Fields.dwPetEnumId		= dwPetEnumID;		
	SqlCmd:execute();
end;

