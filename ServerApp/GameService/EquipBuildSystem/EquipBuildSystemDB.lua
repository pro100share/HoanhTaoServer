--[[
	装备修炼系统
	曲莹
	2013-07-24
	]]--

_G.CEquipBuildSystemDB = {}
function CEquipBuildSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CEquipBuildSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CEquipBuildSystemDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CErrantSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CErrantSystemDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CErrantSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CErrantSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;

--update T_Equip_Build_Info	
function CEquipBuildSystemDB:SetEquipBuildInfo(dwRoleID, szEquipBuild)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Equip_Build_Info')
	SqlCmd.Fields.szBuildInfo = szEquipBuild;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Equip_Build_Info	dwSuitLevel
function CEquipBuildSystemDB:SetEquipSuitInfo(dwRoleID, dwSuitLevel)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Equip_Build_Info')
	SqlCmd.Fields.dwSuitLevel = dwSuitLevel;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

--update T_Role_EquipBuild_Info
function CEquipBuildSystemDB:UpdateBlessInfo(dwRoleID, dwCritBless, dwBuildNum)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_EquipBuild_Info')
	SqlCmd.Fields.dwCritBless = dwCritBless;
	SqlCmd.Fields.dwBuildNum = dwBuildNum;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

