--[[
	œ¿“Â—´’¬œµÕ≥
	«˙”®
	2013-07-30
]]--

_G.CErrantHonorSystemDB = {}
function CErrantHonorSystemDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CErrantHonorSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

--update T_Errant_Honor_Info
function CErrantHonorSystemDB:UpdateErrantHonorInfo(dwRoleID, dwCurLevel, dwCurStar)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Errant_Honor_Info')
	SqlCmd.Fields.dwErrantLevel = dwCurLevel;
	SqlCmd.Fields.dwErrantStar = dwCurStar;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

function CErrantHonorSystemDB:SetErrantValue(dwRoleID, dwValue)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Errant_Honor_Info')
	SqlCmd.Fields.dwErrantValue = dwValue;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;
