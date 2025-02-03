--[[
	[ \brief ʥ�������ݿ��ļ�
	[ \author ���в�
	[ \date 2014-5-6
	[ ����ʥ�������ݿ��߼�
	[ 
	]]

_G.CKungFuExtendSystemDB = {};

--[[
	[ \brief �������ݿ�ϵͳ����
	[ \param object objDB ���ݿ�ϵͳ����
	[ \param object objSys ʥ����ϵͳ����
	[ \return object ����ʥ�������ݿ�ϵͳ����
	]]
function CKungFuExtendSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CKungFuExtendSystemDB) do
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
function CKungFuExtendSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CKungFuExtendSystemDB");
		return false;
	end
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CKungFuExtendSystemDB");
		return false;
	end
	local oPlayer = self.m_ObjSys:GetPlayer();
	if not oPlayer then
		_err("oPlayer is null by CKungFuExtendSystemDB");
		return false;
	end
    local nRoleID = oPlayer:GetRoleID();
	if nRoleID == 0 then
		_err("nRoleID == 0  by CKungFuExtendSystemDB");
		return false;
	end
	return true, nRoleID;
end

--[[
	[ \brief ����ʥ����״̬��Ϣ
	[ \param table db_Info Ҫ������ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CKungFuExtendSystemDB:InsertCountInfo(db_Info)
	local validity, nRoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CKungFuExtendSystemDB:InsertStateInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_KungFuExtend");
	SqlCmd.Fields.nRoleId			= nRoleID;
	SqlCmd.Fields.tCount 			= db_Info.tCount;
	SqlCmd:execute()
	return true;
end

--[[
	[ \brief ����ʥ����״̬��Ϣ
	[ \param table db_Info Ҫ���µ��ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CKungFuExtendSystemDB:UpdateCountInfo(db_Info)
	local validity, nRoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CKungFuExtendSystemDB:UpdateHotelCardInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_KungFuExtend");
	SqlCmd.Wheres.nRoleId			= nRoleID;
	SqlCmd.Fields.tCount			= db_Info.tCount;
	SqlCmd:execute()
	return true;
end



