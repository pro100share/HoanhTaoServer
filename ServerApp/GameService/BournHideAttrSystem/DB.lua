--[[
说明：实战隐藏属性数据库
作者：赵旭
时间: 2013-12-13
]] 

-- 系统对象
_G.CBournHideAttrDB = {};

-- @brief 构造函数
-- @param object objDB 数据库对象
-- @return object 系统对象
function CBournHideAttrDB:new(objDB)
	local obj = {}
	obj.objDB = objDB;
	for i, v in pairs(CBournHideAttrDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

-- @brief 更新
-- @param number dwRoleID 角色标识符
-- @param number dwLevel 等级
function CBournHideAttrDB:Update(dwRoleID, dwLevel)
    local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_BournHideAttr');
    SqlCmd.Fields.RoleID = dwRoleID;
    SqlCmd.Wheres.Level = dwLevel;
    SqlCmd:execute();
end
