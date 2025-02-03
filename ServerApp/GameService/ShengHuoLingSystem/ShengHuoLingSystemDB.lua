--[[
	[ \brief ʥ�������ݿ��ļ�
	[ \author ���в�
	[ \date 2014-5-6
	[ ����ʥ�������ݿ��߼�
	[ 
	]]

_G.CShengHuoLingSystemDB = {};

--[[
	[ \brief �������ݿ�ϵͳ����
	[ \param object objDB ���ݿ�ϵͳ����
	[ \param object objSys ʥ����ϵͳ����
	[ \return object ����ʥ�������ݿ�ϵͳ����
	]]
function CShengHuoLingSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CShengHuoLingSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

--[[
	[ \brief ���ϵͳ���ݿ�ģ����Ч��
	[ \return boolean ���ݿ���Ч����true�� ��Ч����false
	]]
function CShengHuoLingSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CShengHuoLingSystemDB");
		return false;
	end
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CShengHuoLingSystemDB");
		return false;
	end
	local objPlayer = self.m_ObjSys:GetPlayer();
	if not objPlayer then
		_err("objPlayer is null by CShengHuoLingSystemDB");
		return false;
	end
    local dwRoleID = objPlayer:GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CShengHuoLingSystemDB");
		return false;
	end
	return true, dwRoleID;
end

--[[
	[ \brief ����ʥ����״̬��Ϣ
	[ \param table db_Info Ҫ������ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CShengHuoLingSystemDB:InsertStateInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CShengHuoLingSystemDB:InsertStateInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_ShengHuoLing");
	SqlCmd.Fields.dwRoleID			= RoleID;
	SqlCmd.Fields.szSetState 		= db_Info.szSetState;
	SqlCmd:execute()
	return true;
end

--[[
	[ \brief ����ʥ����״̬��Ϣ
	[ \param table db_Info Ҫ���µ��ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CShengHuoLingSystemDB:UpdateStateInfo(db_Info)
	local validity, RoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CShengHuoLingSystemDB:UpdateHotelCardInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_ShengHuoLing");
	SqlCmd.Wheres.dwRoleID			= RoleID;
	SqlCmd.Fields.szSetState		= db_Info.szSetState;
	SqlCmd:execute()
	return true;
end



