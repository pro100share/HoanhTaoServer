--[[
	[ \brief 修炼金身数据库文件
	[ \author 李中昌
	[ \date 2014-7-3
	]]

-- 修炼金身数据库系统对象    
_G.CGoldenBodySystemDB = {};

--[[
	[ \brief 创建数据库系统对象
	[ \param object objDB 数据库系统对象
	[ \param object objSys 修炼金身系统对象
	[ \return object 返回修炼金身数据库系统对象
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
	[ \brief 插入修炼金身系统信息
	[插入经验值和修炼值
	[ \param table tInfo 要插入的字段表
	[ \return boolean 执行成功true, 执行失败false
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
	[ \brief 更新修炼金身系统信息
	[ \param table tInfo 要更新的字段表
	[ \return boolean 执行成功true, 执行失败false
	]]
function CGoldenBodySystemDB:UpdateInfo(tInfo)
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_GoldenBody");
	SqlCmd.Wheres.nRoleId			= self.m_ObjSys:GetPlayer():GetRoleID();
	SqlCmd.Fields.nExp 				= tInfo.nExp;
	SqlCmd.Fields.nPractice 		= tInfo.nPractice;
	SqlCmd:execute()
	return true;
end



