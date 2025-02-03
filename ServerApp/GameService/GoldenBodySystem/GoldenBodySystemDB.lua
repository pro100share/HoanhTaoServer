--[[
	[ \brief �����������ݿ��ļ�
	[ \author ���в�
	[ \date 2014-7-3
	]]

-- �����������ݿ�ϵͳ����    
_G.CGoldenBodySystemDB = {};

--[[
	[ \brief �������ݿ�ϵͳ����
	[ \param object objDB ���ݿ�ϵͳ����
	[ \param object objSys ��������ϵͳ����
	[ \return object ���������������ݿ�ϵͳ����
	]]
function CGoldenBodySystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CGoldenBodySystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

--[[
	[ \brief ������������ϵͳ��Ϣ
	[���뾭��ֵ������ֵ
	[ \param table tInfo Ҫ������ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CGoldenBodySystemDB:InsertInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_GoldenBody");
	SqlCmd.Fields.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.nExp 				= tInfo.nExp;
	SqlCmd.Fields.nPractice 		= tInfo.nPractice;
	SqlCmd:execute()
	return true;
end

--[[
	[ \brief ������������ϵͳ��Ϣ
	[ \param table tInfo Ҫ���µ��ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CGoldenBodySystemDB:UpdateInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_GoldenBody");
	SqlCmd.Wheres.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.nExp 				= tInfo.nExp;
	SqlCmd.Fields.nPractice 		= tInfo.nPractice;
	SqlCmd:execute()
	return true;
end



