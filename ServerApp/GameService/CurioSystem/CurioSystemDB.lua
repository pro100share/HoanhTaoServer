--[[
    [ \brief �Ŷ����ݿ��ļ�
    [ \author ���в�
    [ \date 2014-5-6
    [ ����Ŷ����ݿ��߼�
    ]]

-- �Ŷ�ϵͳ���ݿ����    
_G.CCurioSystemDB = {};

--[[
    [ \brief �������ݿ�ϵͳ����
    [ \param object objDB ���ݿ�ϵͳ����
    [ \param object objSys �Ŷ�ϵͳ����
    [ \return object ���عŶ����ݿ�ϵͳ����
    ]]
function CCurioSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CCurioSystemDB) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

--[[
    [ \brief ����Ŷ�״̬��Ϣ
    [ \param table tInfo Ҫ������ֶα�
    [ \return boolean ִ�гɹ�true, ִ��ʧ��false
    ]]
function CCurioSystemDB:InsertCountInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Curio");
	SqlCmd.Fields.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount 			= tInfo.tCount;
	SqlCmd:execute();
	return true;
end

--[[
    [ \brief ���¹Ŷ�״̬��Ϣ
    [ \param table tInfo Ҫ���µ��ֶα�
    [ \return boolean ִ�гɹ�true, ִ��ʧ��false
    ]]
function CCurioSystemDB:UpdateCountInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Curio");
	SqlCmd.Wheres.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount			= tInfo.tCount;
	SqlCmd:execute();
	return true;
end
