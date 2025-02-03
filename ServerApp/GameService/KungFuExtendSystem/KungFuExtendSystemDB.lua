--[[
	[ \brief 圣火令数据库文件
	[ \author 李中昌
	[ \date 2014-5-6
	[ 处理圣火令数据库逻辑
	[ 
	]]

_G.CKungFuExtendSystemDB = {};

--[[
	[ \brief 创建数据库系统对象
	[ \param object objDB 数据库系统对象
	[ \param object objSys 圣火令系统对象
	[ \return object 返回圣火令数据库系统对象
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
	[ \brief 检查系统数据库模块有效性
	[ \return boolean 数据库有效返回true， 无效返回false
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
	[ \brief 插入圣火令状态信息
	[ \param table db_Info 要插入的字段表
	[ \return boolean 执行成功true, 执行失败false
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
	[ \brief 更新圣火令状态信息
	[ \param table db_Info 要更新的字段表
	[ \return boolean 执行成功true, 执行失败false
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



