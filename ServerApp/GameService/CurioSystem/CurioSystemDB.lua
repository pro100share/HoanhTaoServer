--[[
    [ \brief 古董数据库文件
    [ \author 李中昌
    [ \date 2014-5-6
    [ 处理古董数据库逻辑
    ]]

-- 古董系统数据库对象    
_G.CCurioSystemDB = {};

--[[
    [ \brief 创建数据库系统对象
    [ \param object objDB 数据库系统对象
    [ \param object objSys 古董系统对象
    [ \return object 返回古董数据库系统对象
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
    [ \brief 插入古董状态信息
    [ \param table tInfo 要插入的字段表
    [ \return boolean 执行成功true, 执行失败false
    ]]
function CCurioSystemDB:InsertCountInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_Curio");
	SqlCmd.Fields.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount 			= tInfo.tCount;
	SqlCmd:execute();
	return true;
end

--[[
    [ \brief 更新古董状态信息
    [ \param table tInfo 要更新的字段表
    [ \return boolean 执行成功true, 执行失败false
    ]]
function CCurioSystemDB:UpdateCountInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_Curio");
	SqlCmd.Wheres.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.tCount			= tInfo.tCount;
	SqlCmd:execute();
	return true;
end
