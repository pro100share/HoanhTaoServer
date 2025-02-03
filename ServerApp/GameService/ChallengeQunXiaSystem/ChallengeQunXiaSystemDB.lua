--[[
���ܣ���սȺ��ϵͳ���ݿ����
�汾��
	v1.0	2013-11-1 create by lizc
]]

_G.CChallengeQunXiaSystemDB = {};

function CChallengeQunXiaSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CChallengeQunXiaSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end;
--���ϵͳ���ݿ�ģ����Ч��
function CChallengeQunXiaSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CChallengeQunXiaSystemDB");
		return false;
	end;
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CChallengeQunXiaSystemDB");
		return false;
	end;
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CChallengeQunXiaSystemDB");
		return false;
	end;
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CChallengeQunXiaSystemDB");
		return false;
	end;
	return true, dwRoleID;
end;
------------------------------------------------------------------------------------------------------------------------
----------------------------------------------��սȺ��ϵͳ��Ϣ���--------------------------------------------
------------------------------------------------------------------------------------------------------------------------
--������սȺ��ϵͳϵͳ��Ϣ
function CChallengeQunXiaSystemDB:InsertQunXiaSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CChallengeQunXiaSystemDB:InsertQunXiaSysInfo");
		return false;
	end;
	
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_QunXia");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.maxTotalCount		= db_Info.maxTotalCount;
	SqlCmd.Fields.curTotalCount		= db_Info.curTotalCount;
	SqlCmd.Fields.setQunXiaCount 	= db_Info.setQunXiaCount;
	SqlCmd:execute()
	return true;
end;

--������սȺ��ϵͳ��Ϣ
function CChallengeQunXiaSystemDB:UpdateQunXiaSysInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CChallengeQunXiaSystemDB:UpdateQunXiaSysInfo");
		return false;
	end;
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_QunXia");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.maxTotalCount		= db_Info.maxTotalCount;
	SqlCmd.Fields.curTotalCount		= db_Info.curTotalCount;
	SqlCmd.Fields.setQunXiaCount 	= db_Info.setQunXiaCount;
	SqlCmd:execute()
	return true;
end;


