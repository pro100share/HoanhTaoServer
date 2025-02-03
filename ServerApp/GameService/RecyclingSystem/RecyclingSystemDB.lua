--[[
    [ \brief ��Դ�������ݿ��ļ�
    [ \author ���в�
    [ \date 2014-8-7
    ]]

-- �����������ݿ�ϵͳ����    
_G.CRecyclingSystemDB = {};

--[[
    [ \brief �������ݿ�ϵͳ����
    [ \param object objDB ���ݿ�ϵͳ����
    [ \param object objSys ��������ϵͳ����
    [ \return object ���������������ݿ�ϵͳ����
    ]]
function CRecyclingSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CRecyclingSystemDB) do
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
function CRecyclingSystemDB:InsertInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Recycling");
	SqlCmd.Fields.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount 			= tInfo.tCount;
	SqlCmd:execute()
	return true;
end

--[[
	[ \brief ������������ϵͳ��Ϣ
	[ \param table tInfo Ҫ���µ��ֶα�
	[ \return boolean ִ�гɹ�true, ִ��ʧ��false
	]]
function CRecyclingSystemDB:UpdateInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Recycling");
	SqlCmd.Wheres.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount 			= tInfo.tCount;
	SqlCmd:execute()
	return true;
end



