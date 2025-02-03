local base = _G;

_G.GetRoleID = {};

local by_role_name_sql = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "szRoleName" LIKE '%s'
]];

local get_account_id_sql = 
[[
SELECT "dwAccountID"
FROM "T_Account_Info"
WHERE "szAccount" = '%s'
]];

local by_account_id_sql = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "dwAccountID" = '%s'
]];

local by_account_ids_sql = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "dwAccountID" IN (%s)
]];

local by_ip_sql = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "szIP" = '%s'
]];

local by_is_online = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "bOnline" = 't'
]];

local by_explicit_role_name = 
[[
SELECT "dwRoleID"
FROM "T_Role_Info"
WHERE "szRoleName" = '%s'
]];

local Trans;
local GetAccountID;

Trans = function (data)
    local res = {};
    if data then
        for k, v in pairs(data) do
            table.insert(res, v.dwRoleID);
        end
    end
    return res;
end

-- @brief 获取角色ID通过角色名(模糊)
-- @param server_id string 服务器ID
-- @param role_name string 角色名
-- @return table 角色ID集合
function GetRoleID:ByRoleName(server_id, role_name)
	if not role_name or role_name == '' then
		return {};
	end
	
	local like_condition = "%" .. role_name .. "%";
    return Trans(base.db.Exec(server_id,
		2,
        string.format(by_role_name_sql, like_condition)));
end

-- @brief 获取角色ID通过账号名(非模糊)
-- @param server_id string 服务器ID
-- @param account string 账号名
-- @return table 角色ID集合
function GetRoleID:ByAccount(server_id, account)
    local account_id = GetAccountID(server_id, account);
    if not account_id then
        return {};
    end
    return Trans(base.db.Exec(server_id,
		2,
        string.format(by_account_id_sql, account_id)));
end

GetAccountID = function (server_id, account)
    local data = base.db.Exec(server_id,
	 	1,
		string.format(get_account_id_sql, account));
    if data and data[1] then
        return data[1].dwAccountID;
    else
        return nil;
    end
end

-- @brief 获取角色ID通过账号ID
-- @param server_id string 服务器ID
-- @param account_id number 账号ID
-- @return table 角色ID集合
function GetRoleID:ByAccountID(server_id, account_id)
	if type(account_id) == "table" then
		local strAccountIDs = base.TableToString(account_id);
		return Trans(base.db.Exec(server_id, 
			2, 
			string.format(by_account_ids_sql, strAccountIDs)));
	else
		return Trans(base.db.Exec(server_id,
			2,
			string.format(by_account_id_sql, tostring(account_id))));
	end
end

-- @brief 获取角色id通过ip
-- @param server_id string 服务器id
-- @param ip string IP
-- @return table 角色ID集合
function GetRoleID:ByIP(server_id, ip)
	if ip == nil or ip == '' then
		return {};
	end
    return Trans(base.db.Exec(server_id, 2, string.format(by_ip_sql, ip)));
end

function GetRoleID:ByIsOnline(server_id)
    return Trans(base.db.Exec(server_id, 2, string.format(by_is_online)));
end

function GetRoleID:ByExplicitRoleName(server_id, explicit_role_name)
	if explicit_role_name == nil or explicit_role_name == '' then
		return {};
	end
	local strRoleName = base.GetMergeRoleName(server_id, explicit_role_name);
	return Trans(base.db.Exec(server_id, 2, string.format(by_explicit_role_name, strRoleName)));
end

function GetRoleID:Attempt(tCmd)
    if tCmd.role_id and type(tCmd.role_id) ~= "table" then
        tCmd.role_id = {tCmd.role_id};
		return;
    end

    if tCmd.role_name then
        tCmd.role_id = GetRoleID:ByRoleName(tCmd.server_id, tCmd.role_name);
    elseif tCmd.account then
        tCmd.role_id = GetRoleID:ByAccount(tCmd.server_id, tCmd.account);
    elseif tCmd.account_id then
        tCmd.role_id = GetRoleID:ByAccountID(tCmd.server_id, tCmd.account_id);
    elseif tCmd.login_ip then
        tCmd.role_id = GetRoleID:ByIP(tCmd.server_id, tCmd.login_ip);
	elseif tCmd.is_online then
		tCmd.role_id = GetRoleID:ByIsOnline(tCmd.server_id);
	elseif tCmd.explicit_role_name then
		tCmd.role_id = GetRoleID:ByExplicitRoleName(tCmd.server_id, tCmd.explicit_role_name);
    else
        tCmd.role_id = {};
        base.Log:Error("GetRoleID:Attempt Type Error");
        base.Log:Error(debug.traceback());
    end
end
