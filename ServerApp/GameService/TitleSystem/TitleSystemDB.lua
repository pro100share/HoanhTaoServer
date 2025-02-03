
_G.CTitleSystemDB = {}
-------------------------------------------------------------------------
function CTitleSystemDB:new(objDB, objSys)
	local obj = {}
	obj.objDB = objDB;
	obj.objSys = objSys;
	for i, v in pairs(CTitleSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
-------------------------------------------------------------------------
function CTitleSystemDB:AddTitle(dwTitleID)
	local SqlCmd = self.objDB:CreateInsertCmd('T_Role_Title');
	SqlCmd.Fields.dwRoleID = self.objSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.dwTitleID = dwTitleID;
	SqlCmd.Fields.dwShow = 0;
	SqlCmd.Fields.dwUpdate = GetCurTime();
	SqlCmd:execute();
end
function CTitleSystemDB:DelTitle(dwTitleID)
	local SqlCmd = self.objDB:CreateDeleteCmd('T_Role_Title');
	SqlCmd.Wheres.dwRoleID = self.objSys:GetPlayer():GetRoleID();
	SqlCmd.Wheres.dwTitleID = dwTitleID;
	SqlCmd:execute();
end
function CTitleSystemDB:SetTitle(dwTitleID,dwShow)
	local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_Title');
	SqlCmd.Fields.dwShow = dwShow;
	SqlCmd.Wheres.dwRoleID = self.objSys:GetPlayer():GetRoleID();
	SqlCmd.Wheres.dwTitleID = dwTitleID;
	SqlCmd:execute();
end
-------------------------------------------------------------------------