--[[
	[ \brief 通天塔数据库文件
	[ \author 李中昌
	[ \date 2014-5-6
	[ 处理通天塔数据库逻辑
	]]

_G.CTongTianTowerSystemDB = {};

--[[
	[ \brief 创建数据库系统对象
	[ \param object objDB 数据库系统对象
	[ \param object objSys 通天塔系统对象
	[ \return object 返回通天塔数据库系统对象
	]]
function CTongTianTowerSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(CTongTianTowerSystemDB) do
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
function CTongTianTowerSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CTongTianTowerSystemDB");
		return false;
	end
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CTongTianTowerSystemDB");
		return false;
	end
	local oPlayer = self.m_ObjSys:GetPlayer();
	if not oPlayer then
		_err("oPlayer is null by CTongTianTowerSystemDB");
		return false;
	end
    local nRoleID = oPlayer:GetRoleID();
	if nRoleID == 0 then
		_err("nRoleID == 0  by CTongTianTowerSystemDB");
		return false;
	end
	return true, nRoleID;
end

--[[
	[ \brief 插入通天塔状态信息
	[ \param table db_Info 要插入的字段表
	[ \return boolean 执行成功true, 执行失败false
	]]
function CTongTianTowerSystemDB:InsertInfo(db_Info)
	local validity, nRoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CTongTianTowerSystemDB:InsertStateInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_TongTianTower_Info");
	SqlCmd.Fields.nRoleId			= nRoleID;
	SqlCmd.Fields.nCurLayer 		= db_Info.nCurLayer;
	SqlCmd.Fields.nExtraCount 		= db_Info.nExtraCount;
	SqlCmd.Fields.nAllTime 			= db_Info.nAllTime;
	SqlCmd.Fields.nWeekLayer 		= db_Info.nWeekLayer;
	SqlCmd.Fields.nWeekTime 		= db_Info.nWeekTime;
	SqlCmd:execute()
	return true;
end

--[[
	[ \brief 更新通天塔状态信息
	[ \param table db_Info 要更新的字段表
	[ \return boolean 执行成功true, 执行失败false
	]]
function CTongTianTowerSystemDB:UpdateInfo(db_Info)
	local validity, nRoleID = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CTongTianTowerSystemDB:UpdateHotelCardInfo");
		return false;
	end
	
	local SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_TongTianTower_Info");
	SqlCmd.Wheres.nRoleId			= nRoleID;
	SqlCmd.Fields.nCurLayer 		= db_Info.nCurLayer;
	SqlCmd.Fields.nExtraCount 		= db_Info.nExtraCount;
	SqlCmd.Fields.nAllTime 			= db_Info.nAllTime;
	SqlCmd.Fields.nWeekLayer 		= db_Info.nWeekLayer;
	SqlCmd.Fields.nWeekTime 		= db_Info.nWeekTime;
	SqlCmd:execute()
	return true;
end
