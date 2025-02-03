--[[
说明：武侠令数据库
作者：赵旭
时间: 2013-12-13
]] 

-- 系统对象
_G.CWuXiaLingDB = {};

-- @brief 构造函数
-- @param object objDB 数据库对象
-- @return object 系统对象
function CWuXiaLingDB:new(objDB)
	local obj = {}
	obj.objDB = objDB;
	for i, v in pairs(CWuXiaLingDB) do
		if type(v) == "function" then
			obj[i] = v;
		end;
	end;
	return obj;
end

-- @brief 更新
-- @param number dwRoleID 角色标识符
-- @param number dwInsignia 勋章
function CWuXiaLingDB:Update(dwRoleID, dwInsignia)
    local SqlCmd = self.objDB:CreateUpdateCmd('T_Role_WuXiaLing');
    SqlCmd.Fields.RoleID = dwRoleID;
    SqlCmd.Wheres.Insignia = dwInsignia;
    SqlCmd:execute()
end
