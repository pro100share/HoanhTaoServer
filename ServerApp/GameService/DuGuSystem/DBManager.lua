--[[
	[\brief 数据库操作
	[\author 王凌波
	[\date 2014-5-30
	[实现了数据向数据库的插入、更新操作
  ]]

_G.CDuGuSystemDB = {};

function CDuGuSystemDB:new(objDB, objSys)
	local obj = {};
	obj.m_ObjDB = objDB;
	obj.m_ObjSys = objSys;
	for i, v in pairs(self) do
		if type(v) == "function" then
			obj[i] = v;
		end
	end
	return obj;
end

-- 检查系统数据库模块有效性
--[[
	[\brief 检查系统数据库模块有效性
	[\return boolean true表示合法，false表示非法
	[\return number 玩家的角色id
  ]]
function CDuGuSystemDB:CheckDBValidityAndGetRoleID()
	if not self.m_ObjDB then
		_err("self.m_ObjDB is null by CDuGuSystemDB");
		return false;
	end
	if not self.m_ObjSys then
		_err("self.m_ObjSys is null by CDuGuSystemDB");
		return false;
	end
    local dwRoleID = self.m_ObjSys:GetPlayer():GetRoleID();
	if dwRoleID == 0 then
		_err("dwRoleID == 0  by CDuGuSystemDB");
		return false;
	end
	return true, dwRoleID;
end

--[[
	[\brief 执行插入or更新操作
	[\param string sType "Insert"表示要执行插入操作，"Update"表示要执行更新操作
	[\param table tInfo 包含进行数据库操作的数据
	[\return boolean true表示操作成功，false表示操作未成功
  ]]
function CDuGuSystemDB:Execute(sType, tInfo)           --Todo 分为多个函数 会减少赋值判断等
	local validity, dwRoleId = self:CheckDBValidityAndGetRoleID();
	if not validity then 
		_err("DB invalidity by CDuGuSystemDB:Execute()");
		return false;
	end

	local dwEXP 				= tInfo.dwEXP;             	-- 历练值
	local nActSwordId 			= tInfo.nActSwordId;		-- 已激活的剑套装标识
	local nPrimaryTimes 		= tInfo.nPrimaryTimes;		-- 今天已进行过的初级修炼的次数
	local nIntermediateTimes 	= tInfo.nIntermediateTimes; -- 今天已进行过的中级修炼的次数
	local nAdvancedTimes 		= tInfo.nAdvancedTimes;		-- 今天已进行过的高级修炼的次数
	local SqlCmd;
	if sType == "Insert" then 
		SqlCmd = self.m_ObjDB:CreateInsertCmd("T_Role_DuGuJiuJian_Info");
		SqlCmd.Fields.dwRoleId = dwRoleId;
	elseif sType == "Update" then
		SqlCmd = self.m_ObjDB:CreateUpdateCmd("T_Role_DuGuJiuJian_Info");
		SqlCmd.Wheres.dwRoleId = dwRoleId;
	end

	local bNoField = true;
	if dwEXP then 
		SqlCmd.Fields.dwEXP	= dwEXP;
		bNoField = false;
	end
	if nActSwordId then 
		SqlCmd.Fields.nActSwordId = nActSwordId;
		bNoField = false;
	end
	if nPrimaryTimes then 
		SqlCmd.Fields.nPrimaryTimes = nPrimaryTimes;
		bNoField = false;
	end
	if nIntermediateTimes then 
		SqlCmd.Fields.nIntermediateTimes = nIntermediateTimes;
		bNoField = false;
	end
	if nAdvancedTimes then 
		SqlCmd.Fields.nAdvancedTimes = nAdvancedTimes;
		bNoField = false;
	end
	if bNoField then 
		_err("No update-field by CDuGuSystemDB:Execute()".." "..sType);
		return false;
	end

	SqlCmd:execute();

	return true;
end
