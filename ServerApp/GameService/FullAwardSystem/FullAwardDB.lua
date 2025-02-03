--[[
	��ֵ�������ݿ�
	��Ө
	2013-06-12
]]--

_G.CFullAwardDB = {}
function CFullAwardDB:new(objDB, objSys)
	local obj = {}
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CFullAwardDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--update T_Role_Full_Award(���γ�ֵ)
function CFullAwardDB:SetPerFullInfo(dwRoleID, value)
	-- print("=======SetPerFullInfo====", dwRoleID, value);
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Full_Award')
	SqlCmd.Fields.dwPerAwardPhase = value;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;
--update T_Role_Full_Award(�ۻ���ֵ)
function CFullAwardDB:SetAddiFullInfo(dwRoleID, value)
	-- print("=======SetPerFullInfo=DB===", dwRoleID, value);
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd('T_Role_Full_Award')
	SqlCmd.Fields.dwAddiAwardPhase = value;
	SqlCmd.Wheres.dwRoleId = dwRoleID;
	SqlCmd:execute();
end;
