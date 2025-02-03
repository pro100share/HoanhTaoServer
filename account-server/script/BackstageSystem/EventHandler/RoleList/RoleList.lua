local base = _G;

local load_sql;
local role_list;

local sql_script_dir = BackstageSystem.strEventHandlerDir ..
    "RoleList/SqlScript/";
local query_cmd = {
    sql_script = "RoleList.sql",
    sql = nil,
	format = function (data)
		if not data then
			return {};
		end
		for k, v in pairs(data) do
            v.dwAccountID = base.GetOriginAccountID(v.dwAccountID);
			v.dwLevel = base.RoleUpLevelConfig:ExpToLevel(
                tonumber(v.dwTotalExp)) or 1;
			v.dwTotalExp = nil;
		end
		return data;
	end
};

-- @brief 加载sql脚本
load_sql = function ()
    query_cmd.sql = base.db.LoadSql(sql_script_dir .. query_cmd.sql_script);
end

-- @brief 获取角色列表
-- @param tCmd table 命令表
-- @retrun json 查询结果
role_list = function (tCmd)
	base.GetRoleID:Attempt(tCmd);
	if not next(tCmd.role_id) then
		return {};
	end
	
    local sql = base.AddPaging(tCmd.page,
        tCmd.page_size,
        string.format(query_cmd.sql,
            base.TableToString(tCmd.role_id)));
    return query_cmd.format(base.db.Exec(tCmd.server_id, 2, sql));
end

load_sql();
BackstageSystem:RegistEvent("role_list", role_list);
