--[[
	[ \brief 圣火令数据库文件
	[ \author 李中昌
	[ \date 2014-5-6
	[ 处理圣火令数据库逻辑
	[ 
	]]

_G.CShengHuoLingSystemDB = {};

--[[
	[ \brief 创建数据库系统对象
	[ \param object objDB 数据库系统对象
	[ \param object objSys 圣火令系统对象
	[ \return object 返回圣火令数据库系统对象
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
	[ \brief 检查系统数据库模块有效性
	[ \return boolean 数据库有效返回true， 无效返回false
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
	[ \brief 插入圣火令状态信息
	[ \param table db_Info 要插入的字段表
	[ \return boolean 执行成功true, 执行失败false
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
	[ \brief 更新圣火令状态信息
	[ \param table db_Info 要更新的字段表
	[ \return boolean 执行成功true, 执行失败false
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



