--[[
	ÐÞ³ÇÇ½Êý¾Ý¿â
	ÇúÓ¨
	2012-02-24
]]--

_G.CBuildRampartDB = {}
function CBuildRampartDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CBuildRampartDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;

function CBuildRampartDB:UsualMethod()
	if not self.m_ObjDB then
		_info("self.m_ObjDB is null by CBuildRampartDB");
		return false;
	end;
	if not self.m_ObjSys then
		_info("self.m_ObjSys is null by CBuildRampartDB");
		return false;
	end;
	
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_info("objPlayer is null by CBuildRampartDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_info("dwRoleID == 0 by CBuildRampartDB");
		return false;
	end;
	return true, dwRoleID;
end;

--update T_Build_Rampart_Info
function CBuildRampartDB:SetBuildInfo(dwRoleID, strName, value)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Build_Rampart_Info')
	SqlCmd.Fields[strName] = value;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

function CBuildRampartDB:UpdateBuildContri(dwRoleID, value, iconId)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Build_Rampart_Info')
	SqlCmd.Fields.dwContriValue = value;
	SqlCmd.Fields.dwIconId = iconId;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;

function CBuildRampartDB:UpdateAwardState(dwRoleID, curPlan, state)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Build_Rampart_Info')
	SqlCmd.Fields.dwState = curPlan;
	SqlCmd.Fields.dwStateFlag = state;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;